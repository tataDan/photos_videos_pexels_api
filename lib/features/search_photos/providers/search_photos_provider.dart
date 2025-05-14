import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/search_photos_model.dart';
import 'repositories/search_photos_repository_provider.dart';
import 'search_photos_state.dart';

part 'search_photos_provider.g.dart';

@riverpod
class SearchPhotos extends _$SearchPhotos {
  @override
  SearchPhotosState build() {
    return SearchPhotosState();
  }

  Future<void> getSearchPhotos() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      SearchPhotosModel photosTemp = await ref
          .read(searchPhotosRepositoryProvider)
          .fetchPhotos(page: state.currentPage);
      List photos = photosTemp.photos;
      state = state.copyWith(
        currentPage: state.currentPage + 1,
        photosList: [...state.photosList, ...photos],
        fetchSearchPhotosError: '',
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        fetchSearchPhotosError: e.toString(),
        isLoading: false,
      );
      rethrow;
    }
  }
}

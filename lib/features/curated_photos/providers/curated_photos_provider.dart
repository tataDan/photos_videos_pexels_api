import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/curated_photos_model.dart';
import 'curated_photos_state.dart';
import 'repositories/curated_photos_repository_provider.dart';

part 'curated_photos_provider.g.dart';

@riverpod
class CuratedPhotos extends _$CuratedPhotos {
  @override
  CuratedPhotosState build() {
    return CuratedPhotosState();
  }

  Future<void> getCuratedPhotos() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      CuratedPhotosModel photosTemp = await ref
          .read(curatedPhotosRepositoryProvider)
          .fetchPhotos(page: state.currentPage);
      List photos = photosTemp.photos;
      state = state.copyWith(
        currentPage: state.currentPage + 1,
        photosList: [...state.photosList, ...photos],
        fetchCuratedPhotosError: '',
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        fetchCuratedPhotosError: e.toString(),
        isLoading: false,
      );
      rethrow;
    }
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/photo_model.dart';
import '../repositories/photo_repository_provider.dart';
import 'photo_state.dart';

part 'photo_provider.g.dart';

@riverpod
class Photo extends _$Photo {
  @override
  PhotoState build() {
    return PhotoState();
  }

  Future<PhotoModel> getPhotoModel() async {
    state = state.copyWith(isLoading: true);
    try {
      PhotoModel photo = await ref.read(photoRepositoryProvider).fetchPhoto();
      state = state.copyWith(
        photo: photo,
        currentPage: state.currentPage + 1,
        fetchPhotoError: '',
        isLoading: false,
      );
      return photo;
    } on Exception catch (e) {
      state = state.copyWith(fetchPhotoError: e.toString(), isLoading: false);
      rethrow;
    }
  }
}

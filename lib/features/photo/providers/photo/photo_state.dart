import '../../models/photo_model.dart';

class PhotoState {
  final int currentPage;
  final PhotoModel photo;
  final bool isLoading;
  final String fetchPhotoError;

  PhotoState({
    this.currentPage = 1,
    this.photo = const PhotoModel(
      id: 0,
      width: 0,
      height: 0,
      url: '',
      photographer: '',
      photographerUrl: '',
      photographerId: 0,
      avgColor: '',
      src: {},
      liked: false,
      alt: '',
    ),
    this.isLoading = false,
    this.fetchPhotoError = '',
  });

  PhotoState copyWith({
    int? currentPage,
    PhotoModel? photo,
    bool? isLoading,
    String? fetchPhotoError,
  }) {
    return PhotoState(
      currentPage: currentPage ?? this.currentPage,
      photo: photo ?? this.photo,
      isLoading: isLoading ?? this.isLoading,
      fetchPhotoError: fetchPhotoError ?? this.fetchPhotoError,
    );
  }
}

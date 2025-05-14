class CuratedPhotosState {
  final int currentPage;
  final List<dynamic> photosList;
  final bool isLoading;
  final String fetchCuratedPhotosError;

  CuratedPhotosState({
    this.currentPage = 1,
    this.photosList = const [],
    this.isLoading = false,
    this.fetchCuratedPhotosError = '',
  });

  CuratedPhotosState copyWith({
    int? currentPage,
    List<dynamic>? photosList,
    bool? isLoading,
    String? fetchCuratedPhotosError,
  }) {
    return CuratedPhotosState(
      currentPage: currentPage ?? this.currentPage,
      photosList: photosList ?? this.photosList,
      isLoading: isLoading ?? this.isLoading,
      fetchCuratedPhotosError:
          fetchCuratedPhotosError ?? this.fetchCuratedPhotosError,
    );
  }
}

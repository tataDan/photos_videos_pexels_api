class SearchPhotosState {
  final int currentPage;
  final List<dynamic> photosList;
  final bool isLoading;
  final String fetchSearchPhotosError;

  SearchPhotosState({
    this.currentPage = 1,
    this.photosList = const [],
    this.isLoading = false,
    this.fetchSearchPhotosError = '',
  });

  SearchPhotosState copyWith({
    int? currentPage,
    List<dynamic>? photosList,
    bool? isLoading,
    String? fetchSearchPhotosError,
  }) {
    return SearchPhotosState(
      currentPage: currentPage ?? this.currentPage,
      photosList: photosList ?? this.photosList,
      isLoading: isLoading ?? this.isLoading,
      fetchSearchPhotosError:
          fetchSearchPhotosError ?? this.fetchSearchPhotosError,
    );
  }
}

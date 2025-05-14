class SearchVideosState {
  final int currentPage;
  final List<dynamic> videosList;
  final bool isLoading;
  final String fetchSearchVideosError;

  SearchVideosState({
    this.currentPage = 1,
    this.videosList = const [],
    this.isLoading = false,
    this.fetchSearchVideosError = '',
  });

  SearchVideosState copyWith({
    int? currentPage,
    List<dynamic>? videosList,
    bool? isLoading,
    String? fetchSearchVideosError,
  }) {
    return SearchVideosState(
      currentPage: currentPage ?? this.currentPage,
      videosList: videosList ?? this.videosList,
      isLoading: isLoading ?? this.isLoading,
      fetchSearchVideosError:
          fetchSearchVideosError ?? this.fetchSearchVideosError,
    );
  }
}

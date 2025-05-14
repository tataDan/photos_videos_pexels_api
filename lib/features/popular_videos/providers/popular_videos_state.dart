class PopularVideosState {
  final int currentPage;
  final List<dynamic> videosList;
  final bool isLoading;
  final String fetchPopularVideosError;

  PopularVideosState({
    this.currentPage = 1,
    this.videosList = const [],
    this.isLoading = false,
    this.fetchPopularVideosError = '',
  });

  PopularVideosState copyWith({
    int? currentPage,
    List<dynamic>? videosList,
    bool? isLoading,
    String? fetchPopularVideosError,
  }) {
    return PopularVideosState(
      currentPage: currentPage ?? this.currentPage,
      videosList: videosList ?? this.videosList,
      isLoading: isLoading ?? this.isLoading,
      fetchPopularVideosError:
          fetchPopularVideosError ?? this.fetchPopularVideosError,
    );
  }
}

class SearchVideosModel {
  final int page;
  final int perPage;
  final List<dynamic> videos;
  final int totalResults;
  final String nextPage;

  const SearchVideosModel({
    required this.page,
    required this.perPage,
    required this.videos,
    required this.totalResults,
    required this.nextPage,
  });

  factory SearchVideosModel.fromJson(Map<String, dynamic> json) {
    return SearchVideosModel(
      page: json['page'],
      perPage: json['per_page'],
      videos: json['videos'],
      totalResults: json['total_results'],
      nextPage: json['next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'videos': videos,
      'totalResults': totalResults,
      'nextPage': nextPage,
    };
  }

  @override
  String toString() {
    return "SearchVideosModel(page: $page, videos: $videos,"
        "totalResults: $totalResults, nextPage: $nextPage,";
  }

  factory SearchVideosModel.defaultValues() {
    return SearchVideosModel(
      page: 0,
      perPage: 0,
      videos: [],
      totalResults: 0,
      nextPage: '',
    );
  }
}

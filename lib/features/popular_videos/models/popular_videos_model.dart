class PopularVideosModel {
  final int page;
  final int perPage;
  final List<dynamic> videos;
  final int totalResults;
  final String nextPage;
  final String url;

  const PopularVideosModel({
    required this.page,
    required this.perPage,
    required this.videos,
    required this.totalResults,
    required this.nextPage,
    required this.url,
  });

  factory PopularVideosModel.fromJson(Map<String, dynamic> json) {
    return PopularVideosModel(
      page: json['page'],
      perPage: json['per_page'],
      videos: json['videos'],
      totalResults: json['total_results'],
      nextPage: json['next_page'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'videos': videos,
      'totalResults': totalResults,
      'nextPage': nextPage,
      'url': url,
    };
  }

  @override
  String toString() {
    return 'PopularVideosModel(page: $page, per_page: $perPage, videos: $videos,'
        'totalResults: $totalResults, nextPage: $nextPage, url: $url';
  }

  factory PopularVideosModel.defaultValues() {
    return PopularVideosModel(
      page: 0,
      perPage: 0,
      videos: [],
      totalResults: 0,
      nextPage: '',
      url: '',
    );
  }
}

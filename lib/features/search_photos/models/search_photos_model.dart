class SearchPhotosModel {
  final int page;
  final int perPage;
  final List<dynamic> photos;
  final int totalResults;
  final String nextPage;

  const SearchPhotosModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  factory SearchPhotosModel.fromJson(Map<String, dynamic> json) {
    return SearchPhotosModel(
      page: json['page'],
      perPage: json['per_page'],
      photos: json['photos'],
      totalResults: json['total_results'],
      nextPage: json['next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'photos': photos,
      'totalResults': totalResults,
      'nextPage': nextPage,
    };
  }

  @override
  String toString() {
    return "SearchPhotosModel(page: $page, photos: $photos,"
        "totalResults: $totalResults, nextPage: $nextPage,";
  }

  factory SearchPhotosModel.defaultValues() {
    return SearchPhotosModel(
      page: 0,
      perPage: 0,
      photos: [],
      totalResults: 0,
      nextPage: '',
    );
  }
}

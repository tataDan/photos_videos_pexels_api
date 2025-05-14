class PhotoModel {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Map<String, dynamic> src;
  final bool liked;
  final String alt;

  const PhotoModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: json['src'],
      liked: json['liked'],
      alt: json['alt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographerUrl': photographerUrl,
      'photographerId': photographerId,
      'avgColor': avgColor,
      'src': src,
      'liked': liked,
      'alt': alt,
    };
  }

  @override
  String toString() {
    return "PhotoModel(id: $id, width: $width, height: $height, url: $url,"
        "photographer: $photographer, photographerUrl: $photographerUrl,"
        "photographerId: $photographerId, avgColor: $avgColor, src: $src,"
        "liked: $liked, alt: $alt,)";
  }

  factory PhotoModel.defaultValues() {
    return PhotoModel(
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
    );
  }
}

class VideoModel {
  final int id;
  final int width;
  final int height;
  final String url;
  final String image;
  // final fullRes;
  // final List tags;
  final int duration;
  final Map<String, dynamic> user;
  final List<dynamic> videoFiles;
  final List<dynamic> videoPictures;

  const VideoModel({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.image,
    // required this.fullRes,
    // required this.tags,
    required this.duration,
    required this.user,
    required this.videoFiles,
    required this.videoPictures,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      image: json['image'],
      // fullRes: json['full_res'],
      // tags: json['tags'],
      duration: json['duration'],
      user: json['user'],
      videoFiles: json['video_files'],
      videoPictures: json['video_pictures'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'image': image,
      // 'fullRes': fullRes,
      // 'tags': tags,
      'duration': duration,
      'user': user,
      'videoFiles': videoFiles,
      'videoPictures': videoPictures,
    };
  }

  @override
  String toString() {
    return "VideoModel(id: $id, width: $width, height: $height, url: $url,"
        "image: $image, duration: $duration,"
        "user: $user, videoFiles: $videoFiles, videoPictures: $videoPictures,";
  }
  // Add fullRes & tags?

  factory VideoModel.defaultValues() {
    return VideoModel(
      id: 0,
      width: 0,
      height: 0,
      url: '',
      image: '',
      // fullRes: ,
      // tags: [],
      duration: 0,
      user: {},
      videoFiles: [],
      videoPictures: [],
    );
  }
}

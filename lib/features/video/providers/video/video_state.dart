import '../../models/video_model.dart';

class VideoState {
  final int currentPage;
  final VideoModel video;
  final bool isLoading;
  final String fetchVideoError;

  VideoState({
    this.currentPage = 1,
    this.video = const VideoModel(
      id: 0,
      width: 0,
      height: 0,
      url: '',
      image: '',
      duration: 0,
      user: {},
      videoFiles: [],
      videoPictures: [],
    ),
    this.isLoading = false,
    this.fetchVideoError = '',
  });

  VideoState copyWith({
    int? currentPage,
    VideoModel? video,
    bool? isLoading,
    String? fetchVideoError,
  }) {
    return VideoState(
      currentPage: currentPage ?? this.currentPage,
      video: video ?? this.video,
      isLoading: isLoading ?? this.isLoading,
      fetchVideoError: fetchVideoError ?? this.fetchVideoError,
    );
  }
}

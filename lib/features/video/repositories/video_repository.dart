import '../models/video_model.dart';
import '../services/video_api_service.dart';

class VideoRepository {
  final VideoApiService videoApiService;
  VideoRepository({required this.videoApiService});

  Future<VideoModel> fetchVideo() async {
    return await videoApiService.fetchVideo();
  }
}

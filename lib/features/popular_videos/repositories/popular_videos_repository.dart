import '../models/popular_videos_model.dart';
import '../services/popular_videos_api_service.dart';

class PopularVideosRepository {
  final PopularVideosApiService popularVideosApiService;
  PopularVideosRepository({required this.popularVideosApiService});

  Future<PopularVideosModel> fetchVideos({required int page}) async {
    return await popularVideosApiService.fetchVideos(page: page);
  }
}

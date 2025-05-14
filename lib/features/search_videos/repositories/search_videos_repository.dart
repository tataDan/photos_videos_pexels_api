import '../models/search_videos_model.dart';
import '../services/search_videos_api_service.dart';

class SearchVideosRepository {
  final SearchVideosApiService searchVideosApiService;
  SearchVideosRepository({required this.searchVideosApiService});

  Future<SearchVideosModel> fetchVideos({required int page}) async {
    return await searchVideosApiService.fetchVideos(page: page);
  }
}

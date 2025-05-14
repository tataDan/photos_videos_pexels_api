import '../models/search_photos_model.dart';
import '../services/search_photos_api_service.dart';

class SearchPhotosRepository {
  final SearchPhotosApiService searchPhotosApiService;
  SearchPhotosRepository({required this.searchPhotosApiService});

  Future<SearchPhotosModel> fetchPhotos({required int page}) async {
    return await searchPhotosApiService.fetchPhotos(page: page);
  }
}

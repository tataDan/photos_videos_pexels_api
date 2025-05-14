import '../models/curated_photos_model.dart';
import '../services/curated_photos_api_service.dart';

class CuratedPhotosRepository {
  final CuratedPhotosApiService curatedPhotosApiService;
  CuratedPhotosRepository({required this.curatedPhotosApiService});

  Future<CuratedPhotosModel> fetchPhotos({required int page}) async {
    return await curatedPhotosApiService.fetchPhotos(page: page);
  }
}

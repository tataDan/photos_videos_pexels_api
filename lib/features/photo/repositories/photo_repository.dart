import '../models/photo_model.dart';
import '../services/photo_api_service.dart';

class PhotoRepository {
  final PhotoApiService photoApiService;
  PhotoRepository({required this.photoApiService});

  Future<PhotoModel> fetchPhoto() async {
    return await photoApiService.fetchPhoto();
  }
}

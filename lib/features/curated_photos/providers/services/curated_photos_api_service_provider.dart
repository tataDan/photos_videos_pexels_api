import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/curated_photos_api_service.dart';

part 'curated_photos_api_service_provider.g.dart';

@riverpod
CuratedPhotosApiService curatedPhotosApiService(Ref ref) {
  return CuratedPhotosApiService();
}

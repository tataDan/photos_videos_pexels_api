import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/photo_api_service.dart';
import '../photoId/photo_id_provider.dart';

part 'photo_api_service_provider.g.dart';

@riverpod
PhotoApiService photoApiService(Ref ref) {
  int id = ref.watch(photoIdProvider);
  return PhotoApiService(id);
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/photo_repository.dart';
import '../services/photo_api_service_provider.dart';

part 'photo_repository_provider.g.dart';

@riverpod
PhotoRepository photoRepository(Ref ref) {
  return PhotoRepository(photoApiService: ref.watch(photoApiServiceProvider));
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/curated_photos_repository.dart';
import '../services/curated_photos_api_service_provider.dart';

part 'curated_photos_repository_provider.g.dart';

@riverpod
CuratedPhotosRepository curatedPhotosRepository(Ref ref) {
  return CuratedPhotosRepository(
    curatedPhotosApiService: ref.watch(curatedPhotosApiServiceProvider),
  );
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/popular_videos_repository.dart';
import '../services/popular_videos_api_service_provider.dart';

part 'popular_videos_repository_provider.g.dart';

@riverpod
PopularVideosRepository popularVideosRepository(Ref ref) {
  return PopularVideosRepository(
    popularVideosApiService: ref.watch(popularVideosApiServiceProvider),
  );
}

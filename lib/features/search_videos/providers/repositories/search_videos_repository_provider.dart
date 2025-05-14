import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/search_videos_repository.dart';
import '../services/search_videos_api_service_provider.dart';

part 'search_videos_repository_provider.g.dart';

@riverpod
SearchVideosRepository searchVideosRepository(Ref ref) {
  return SearchVideosRepository(
    searchVideosApiService: ref.watch(searchVideosApiServiceProvider),
  );
}

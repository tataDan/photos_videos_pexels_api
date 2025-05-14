import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/search_videos_api_service.dart';
import '../search_text/videos_search_text_provider.dart';

part 'search_videos_api_service_provider.g.dart';

@riverpod
SearchVideosApiService searchVideosApiService(Ref ref) {
  String searchText = ref.watch(videosSearchTextProvider);
  return SearchVideosApiService(searchText);
}

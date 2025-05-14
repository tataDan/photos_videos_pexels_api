import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/popular_videos_api_service.dart';

part 'popular_videos_api_service_provider.g.dart';

@riverpod
PopularVideosApiService popularVideosApiService(Ref ref) {
  return PopularVideosApiService();
}

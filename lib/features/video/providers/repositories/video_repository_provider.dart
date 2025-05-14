import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/video_repository.dart';
import '../services/video_api_service_provider.dart';

part 'video_repository_provider.g.dart';

@riverpod
VideoRepository videoRepository(Ref ref) {
  return VideoRepository(videoApiService: ref.watch(videoApiServiceProvider));
}

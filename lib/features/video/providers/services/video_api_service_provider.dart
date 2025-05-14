import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/video_api_service.dart';
import '../video_id/video_id_provider.dart';

part 'video_api_service_provider.g.dart';

@riverpod
VideoApiService videoApiService(Ref ref) {
  int id = ref.watch(videoIdProvider);
  return VideoApiService(id);
}

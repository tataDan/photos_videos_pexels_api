import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_id_provider.g.dart';

@riverpod
class VideoId extends _$VideoId {
  @override
  int build() {
    return 0;
  }

  void updateVideoId(int videoId) {
    state = videoId;
  }
}

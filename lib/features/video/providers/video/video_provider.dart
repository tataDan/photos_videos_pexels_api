import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/video_model.dart';
import '../repositories/video_repository_provider.dart';
import 'video_state.dart';

part 'video_provider.g.dart';

@riverpod
class Video extends _$Video {
  @override
  VideoState build() {
    return VideoState();
  }

  Future<VideoModel> getVideoModel() async {
    state = state.copyWith(isLoading: true);
    try {
      VideoModel video = await ref.read(videoRepositoryProvider).fetchVideo();
      state = state.copyWith(
        video: video,
        currentPage: state.currentPage + 1,
        fetchVideoError: '',
        isLoading: false,
      );
      return video;
    } on Exception catch (e) {
      state = state.copyWith(fetchVideoError: e.toString(), isLoading: false);
      rethrow;
    }
  }
}

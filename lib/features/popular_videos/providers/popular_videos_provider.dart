import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/popular_videos_model.dart';
import 'popular_videos_state.dart';
import 'repositories/popular_videos_repository_provider.dart';

part 'popular_videos_provider.g.dart';

@riverpod
class PopularVideos extends _$PopularVideos {
  @override
  PopularVideosState build() {
    return PopularVideosState();
  }

  Future<void> getPopularVideos() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      PopularVideosModel videosTemp = await ref
          .read(popularVideosRepositoryProvider)
          .fetchVideos(page: state.currentPage);
      List videos = videosTemp.videos;
      state = state.copyWith(
        currentPage: state.currentPage + 1,
        videosList: [...state.videosList, ...videos],
        fetchPopularVideosError: '',
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        fetchPopularVideosError: e.toString(),
        isLoading: false,
      );
      rethrow;
    }
  }
}

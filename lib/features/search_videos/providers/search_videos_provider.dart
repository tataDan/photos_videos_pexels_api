import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/search_videos_model.dart';
import 'repositories/search_videos_repository_provider.dart';
import 'search_videos_state.dart';

part 'search_videos_provider.g.dart';

@riverpod
class SearchVideos extends _$SearchVideos {
  @override
  SearchVideosState build() {
    return SearchVideosState();
  }

  Future<void> getSearchVideos() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      SearchVideosModel videosTemp = await ref
          .read(searchVideosRepositoryProvider)
          .fetchVideos(page: state.currentPage);
      List videos = videosTemp.videos;
      state = state.copyWith(
        currentPage: state.currentPage + 1,
        videosList: [...state.videosList, ...videos],
        fetchSearchVideosError: '',
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        fetchSearchVideosError: e.toString(),
        isLoading: false,
      );
      rethrow;
    }
  }
}

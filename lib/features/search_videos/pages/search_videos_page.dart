import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/videos_widget.dart';
import '../providers/search_text/videos_search_text_provider.dart';
import '../providers/search_videos_provider.dart';
import '../providers/search_videos_state.dart';

class SearchVideosPage extends ConsumerStatefulWidget {
  final String searchText;
  const SearchVideosPage({super.key, required this.searchText});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchVideosPageState();
}

class _SearchVideosPageState extends ConsumerState<SearchVideosPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      ref
          .read(videosSearchTextProvider.notifier)
          .updateSearchText(widget.searchText);
      ref.read(searchVideosProvider.notifier).getSearchVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Videos Page')),
      body: Column(
        children: [
          Text(
            'Please note that the videos will not have audio.',
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Consumer(
              builder: (context, WidgetRef ref, child) {
                ref.watch(videosSearchTextProvider);
                final state = ref.watch(searchVideosProvider);
                if (state.isLoading && state.videosList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state.fetchSearchVideosError.isNotEmpty) {
                  return Center(
                    child: Text(
                      'Fetching the videos failed for search text ${widget.searchText}.\nPlease ensure that'
                      ' your search text is valid. For example "tigers" would be valid, but "1Xe5 would not be.\nPlease'
                      ' click on the back arrow and try again.',
                      style: TextStyle(color: Colors.red, fontSize: 24.0),
                    ),
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !SearchVideosState().isLoading) {
                      ref.read(searchVideosProvider.notifier).getSearchVideos();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.builder(
                    primary: true,
                    itemCount: state.videosList.length,
                    itemBuilder: (context, index) {
                      return VideosWidget(
                        videos: state.videosList,
                        index: index,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

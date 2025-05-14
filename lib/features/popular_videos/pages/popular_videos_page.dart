import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/videos_widget.dart';
import '../providers/popular_videos_provider.dart';
import '../providers/popular_videos_state.dart';

class PopularVideosPage extends ConsumerStatefulWidget {
  const PopularVideosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PopularVideosPageState();
}

class _PopularVideosPageState extends ConsumerState<PopularVideosPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      ref.read(popularVideosProvider.notifier).getPopularVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Videos Page')),
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
                final state = ref.watch(popularVideosProvider);
                if (state.isLoading && state.videosList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state.fetchPopularVideosError.isNotEmpty) {
                  return Center(
                    child: Text(
                      state.fetchPopularVideosError,
                      style: TextStyle(color: Colors.red, fontSize: 24.0),
                    ),
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !PopularVideosState().isLoading) {
                      ref
                          .read(popularVideosProvider.notifier)
                          .getPopularVideos();
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

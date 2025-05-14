import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/video/video_provider.dart';
import '../providers/video/video_state.dart';
import '../providers/video_id/video_id_provider.dart';

class VideoPage extends ConsumerStatefulWidget {
  final int videoId;
  const VideoPage({super.key, required this.videoId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends ConsumerState<VideoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      ref.read(videoIdProvider.notifier).updateVideoId(widget.videoId);
      ref.read(videoProvider.notifier).getVideoModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Page')),
      body: Consumer(
        builder: (context, WidgetRef ref, child) {
          VideoState state = ref.watch(videoProvider);
          var videoFiles = state.video.videoFiles;
          var videoPictures = state.video.videoPictures;
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state.fetchVideoError.isNotEmpty) {
            return Center(
              child: Text(
                'Fetching the video failed for ID ${widget.videoId}.\nPlease ensure that'
                ' your ID does not contain any non-numeric characters.\nPlease'
                ' click on the back arrow and try again.',
                style: TextStyle(color: Colors.red, fontSize: 24.0),
              ),
            );
          }
          return SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('VIDEO DETAILS', style: TextStyle(fontSize: 16)),
                  Divider(),
                  VideoRow(
                    state: state,
                    label: 'id:',
                    value: state.video.id.toString(),
                  ),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'width:',
                    value: state.video.width.toString(),
                  ),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'height:',
                    value: state.video.height.toString(),
                  ),
                  const SizedBox(height: 10),
                  VideoRow(state: state, label: 'URL:', value: state.video.url),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'image:',
                    value: state.video.image,
                  ),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'duration:',
                    value: state.video.duration.toString(),
                  ),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'user id:',
                    value: state.video.user['id'].toString(),
                  ),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'user name:',
                    value: state.video.user['name'].toString(),
                  ),
                  const SizedBox(height: 10),
                  VideoRow(
                    state: state,
                    label: 'user url:',
                    value: state.video.user['url'].toString(),
                  ),
                  const SizedBox(height: 10),
                  for (int i = 0; i < videoFiles.length; i++)
                    Column(
                      children: [
                        VideoRow(
                          state: state,
                          label: 'video_files id:',
                          value: videoFiles[i]['id'].toString(),
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files file_type:',
                          value: videoFiles[i]['file_type'],
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files quality:',
                          value: videoFiles[i]['quality'],
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files width:',
                          value: videoFiles[i]['width'].toString(),
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files height:',
                          value: videoFiles[i]['height'].toString(),
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files fps:',
                          value: videoFiles[i]['fps'].toString(),
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files link:',
                          value: videoFiles[i]['link'],
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_files size:',
                          value: videoFiles[i]['size'].toString(),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  const SizedBox(height: 5),
                  for (int i = 0; i < videoPictures.length; i++)
                    Column(
                      children: [
                        VideoRow(
                          state: state,
                          label: 'video_picture: id:',
                          value: videoPictures[i]['id'].toString(),
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_pictures nr:',
                          value: videoPictures[i]['nr'].toString(),
                        ),
                        const SizedBox(height: 5),
                        VideoRow(
                          state: state,
                          label: 'video_pictures: picture',
                          value: videoPictures[i]['picture'],
                        ),
                      ],
                    ),
                  Divider(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoRow extends StatelessWidget {
  const VideoRow({
    super.key,
    required this.state,
    required this.label,
    required this.value,
  });

  final VideoState state;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 10),
        Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
      ],
    );
  }
}

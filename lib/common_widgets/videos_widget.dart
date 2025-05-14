import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

import '../features/video/pages/video_page.dart';
import 'videos_image_network_widget.dart';

class VideosWidget extends ConsumerStatefulWidget {
  const VideosWidget({super.key, required this.videos, required this.index});
  final List<dynamic> videos;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideosWidgetState();
}

class _VideosWidgetState extends ConsumerState<VideosWidget> {
  Uri _videoUrl = Uri();
  Uri _userUrl = Uri();

  @override
  Widget build(BuildContext context) {
    _videoUrl = Uri.parse(widget.videos[widget.index]['url']);
    _userUrl = Uri.parse(widget.videos[widget.index]['user']['url']);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          VideosImageNetworkWidget(videos: widget.videos, widget: widget),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Video ID: '),
              Text(widget.videos[widget.index]['id'].toString()),
              SizedBox(height: 20),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('User:  '),
              Text(widget.videos[widget.index]['user']['name']),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _launchVideoUrl,
            child: Text('Show Video Web Page'),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: _launchUserUrl,
            child: Text('Show Video User Web Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              int id = widget.videos[widget.index]['id'];
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => VideoPage(videoId: id)),
              );
            },
            child: Text('Show Video Details'),
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }

  Future<void> _launchVideoUrl() async {
    if (!await launchUrl(_videoUrl)) {
      throw Exception('Could not launch ${widget.videos[widget.index]['url']}');
    }
  }

  Future<void> _launchUserUrl() async {
    if (!await launchUrl(_userUrl)) {
      throw Exception(
        'Could not launch ${widget.videos[widget.index]['user']['url']}',
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import 'videos_widget.dart';

class VideosImageNetworkWidget extends StatelessWidget {
  const VideosImageNetworkWidget({
    super.key,
    required this.videos,
    required this.widget,
  });

  final List videos;
  final VideosWidget widget;

  static const imageWidth = 200.0;
  static const widthToHeightRatio = 1.5;

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: videos[widget.index]['image'],
      height: imageWidth / widthToHeightRatio,
      width: imageWidth,
      fitAndroidIos: BoxFit.contain,
      fitWeb: BoxFitWeb.contain,
      onLoading: const CircularProgressIndicator(color: Colors.indigoAccent),
      onError: const Icon(Icons.error, color: Colors.red),
      onTap: () {
        debugPrint('Error loading network image');
      },
    );
  }
}

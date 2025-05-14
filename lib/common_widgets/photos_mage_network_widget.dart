import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import 'photos_widget.dart';

class PhotosImageNetworkWidget extends StatelessWidget {
  const PhotosImageNetworkWidget({
    super.key,
    required this.photos,
    required this.widget,
  });

  final List photos;
  final PhotosWidget widget;

  static const imageWidth = 200.0;
  static const widthToHeightRatio = 1.5;

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: photos[widget.index]['src']['original'],
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

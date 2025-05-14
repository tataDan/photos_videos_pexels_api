import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../features/photo/pages/photo_page.dart';
import 'photos_mage_network_widget.dart';

class PhotosWidget extends ConsumerStatefulWidget {
  const PhotosWidget({super.key, required this.photos, required this.index});
  final List<dynamic> photos;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends ConsumerState<PhotosWidget> {
  Uri _photoUrl = Uri();
  Uri _photographerUrl = Uri();

  @override
  Widget build(BuildContext context) {
    _photoUrl = Uri.parse(widget.photos[widget.index]['url']);
    _photographerUrl = Uri.parse(
      widget.photos[widget.index]['photographer_url'],
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PhotosImageNetworkWidget(photos: widget.photos, widget: widget),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Photo ID: '),
              Text(widget.photos[widget.index]['id'].toString()),
              SizedBox(height: 20),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Photographer:  '),
              Expanded(
                child: Text(widget.photos[widget.index]['photographer']),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _launchPhotoUrl,
            child: Text('Show Photo Web Page'),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: _launchPhotographerUrl,
            child: Text('Show Photographer Web Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              int id = widget.photos[widget.index]['id'];
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PhotoPage(photoId: id)),
              );
            },
            child: Text('Show Photo Details'),
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }

  Future<void> _launchPhotoUrl() async {
    if (!await launchUrl(_photoUrl)) {
      throw Exception('Could not launch ${widget.photos[widget.index]['url']}');
    }
  }

  Future<void> _launchPhotographerUrl() async {
    if (!await launchUrl(_photographerUrl)) {
      throw Exception(
        'Could not launch ${widget.photos[widget.index]['photographerUrl']}',
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/curated_photos/pages/curated_photos_page.dart';
import 'features/photo/pages/photo_page.dart';
import 'features/popular_videos/pages/popular_videos_page.dart';
import 'features/search_photos/pages/search_photos_page.dart';
import 'features/search_videos/pages/search_videos_page.dart';
import 'features/video/pages/video_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController photoIdController = TextEditingController();
  TextEditingController videoIdController = TextEditingController();
  TextEditingController photoSearchTextController = TextEditingController();
  TextEditingController videoSearchTextController = TextEditingController();

  @override
  void dispose() {
    photoIdController.dispose();
    videoIdController.dispose();
    photoSearchTextController.dispose();
    videoSearchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Divider(color: Colors.blue),
              // ---------- GO TO CURATED PHOTOS PAGE ----------
              Text(
                'Get Curated Photos',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 175,
                child: FloatingActionButton(
                  heroTag: 'getCuratedPhotos',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CuratedPhotosPage(),
                      ),
                    );
                  },
                  child: Text('Get Curated Photos'),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.blue),

              // ---------- GO TO SEARCH PHOTOS PAGE ----------
              const SizedBox(height: 10),
              Text(
                'Search Photos',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextField(
                controller: photoSearchTextController,
                decoration: InputDecoration(
                  labelText: 'Photo Search Text',
                  filled: true,
                  fillColor: Colors.lightBlue[100],
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 150,
                child: FloatingActionButton(
                  heroTag: 'searchPhotos',
                  onPressed: () async {
                    String searchText = photoSearchTextController.text.trim();
                    if (searchText.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SearchPhotosPage(searchText: searchText),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder:
                            (ctx) => AlertDialog(
                              title: const Text("Error Dialog"),
                              content: const Text(
                                "Please enter some search text",
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                    photoSearchTextController.text = '';
                  },
                  child: Text('Search Photos'),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.blue),

              // ---------- GO TO POPULAR VIDEOS PAGE ----------
              const SizedBox(height: 10),
              Text(
                'Get Popular Videos',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 175,
                child: FloatingActionButton(
                  heroTag: 'getPopularVideos',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PopularVideosPage(),
                      ),
                    );
                  },
                  child: Text('Get Popular Videos'),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.blue),

              // ---------- GO TO SEARCH VIDEOS PAGE ----------
              const SizedBox(height: 10),
              Text(
                'Search Videos',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextField(
                controller: videoSearchTextController,
                decoration: InputDecoration(
                  labelText: 'Video Search Text',
                  filled: true,
                  fillColor: Colors.lightBlue[100],
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 150,
                child: FloatingActionButton(
                  heroTag: 'searchVideo',
                  onPressed: () async {
                    String searchText = videoSearchTextController.text.trim();
                    if (searchText.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SearchVideosPage(searchText: searchText),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder:
                            (ctx) => AlertDialog(
                              title: const Text("Error Dialog"),
                              content: const Text(
                                "Please enter some search text",
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                    videoSearchTextController.text = '';
                  },
                  child: Text('Search Videos'),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.blue),

              // ---------- GO TO PHOTO PAGE ----------
              const SizedBox(height: 10),
              Text(
                'Get a Photo',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextField(
                controller: photoIdController,
                decoration: InputDecoration(
                  labelText: 'Photo ID',
                  filled: true,
                  fillColor: Colors.lightBlue[100],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                child: FloatingActionButton(
                  heroTag: 'getPhoto',
                  onPressed: () async {
                    String idStr = photoIdController.text.trim();
                    if (idStr.isNotEmpty) {
                      int? id = int.tryParse(idStr) ?? 0;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhotoPage(photoId: id),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder:
                            (ctx) => AlertDialog(
                              title: const Text("Error Dialog"),
                              content: const Text(
                                "Please enter a Photo ID number",
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                    photoIdController.text = '';
                  },
                  child: Text('Get Photo by ID'),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.blue),

              // ---------- GO TO VIDEO PAGE ----------
              SizedBox(height: 10),
              Text(
                'Get a Video',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextField(
                controller: videoIdController,
                decoration: InputDecoration(
                  labelText: 'Video ID',
                  filled: true,
                  fillColor: Colors.lightBlue[100],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                child: FloatingActionButton(
                  heroTag: 'getVideo',
                  onPressed: () async {
                    String idStr = videoIdController.text.trim();
                    if (idStr.isNotEmpty) {
                      int? id = int.tryParse(idStr) ?? 0;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VideoPage(videoId: id),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder:
                            (ctx) => AlertDialog(
                              title: const Text("Error Dialog"),
                              content: const Text(
                                "Please enter a Video ID number",
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                      );
                    }
                    videoIdController.text = '';
                  },
                  child: Text('Get Video by ID'),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

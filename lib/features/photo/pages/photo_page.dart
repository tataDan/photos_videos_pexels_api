import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/photo/photo_provider.dart';
import '../providers/photo/photo_state.dart';
import '../providers/photoId/photo_id_provider.dart';

class PhotoPage extends ConsumerStatefulWidget {
  final int photoId;
  const PhotoPage({super.key, required this.photoId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoPageState();
}

class _PhotoPageState extends ConsumerState<PhotoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      ref.read(photoIdProvider.notifier).updateId(widget.photoId);
      ref.read(photoProvider.notifier).getPhotoModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Page')),
      body: Consumer(
        builder: (context, WidgetRef ref, child) {
          List<String> srcList = [
            'original',
            'large2x',
            'large',
            'medium',
            'small',
            'portrait',
            'landscape',
            'tiny',
          ];

          PhotoState state = ref.watch(photoProvider);
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state.fetchPhotoError.isNotEmpty) {
            return Center(
              child: Text(
                'Fetching the photo failed for ID ${widget.photoId}.\nPlease ensure that'
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
                  Text('PHOTO DETAILS', style: TextStyle(fontSize: 16)),
                  Divider(),
                  PhotoRow(
                    state: state,
                    label: 'id:',
                    value: state.photo.id.toString(),
                  ),
                  const SizedBox(height: 10),
                  PhotoRow(
                    state: state,
                    label: 'width:',
                    value: state.photo.width.toString(),
                  ),
                  const SizedBox(height: 10),
                  PhotoRow(
                    state: state,
                    label: 'height:',
                    value: state.photo.height.toString(),
                  ),
                  const SizedBox(height: 10),
                  PhotoRow(state: state, label: 'url:', value: state.photo.url),
                  const SizedBox(height: 10),
                  PhotoRow(
                    state: state,
                    label: 'photographer:',
                    value: state.photo.photographer,
                  ),
                  const SizedBox(height: 10),
                  PhotoRow(
                    state: state,
                    label: 'photographer URL:',
                    value: state.photo.photographerUrl,
                  ),
                  const SizedBox(height: 10),
                  PhotoRow(
                    state: state,
                    label: 'photographer ID:',
                    value: state.photo.photographerId.toString(),
                  ),
                  const SizedBox(height: 5),
                  for (int i = 0; i < srcList.length; i++)
                    if (state.photo.src[srcList[i]] != null)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          PhotoRow(
                            state: state,
                            label: 'src ${srcList[i]}:',
                            value: state.photo.src[srcList[i]],
                          ),
                        ],
                      ),
                  const SizedBox(height: 10),
                  PhotoRow(
                    state: state,
                    label: 'liked:',
                    value: state.photo.liked.toString(),
                  ),
                  const SizedBox(height: 10),
                  PhotoRow(state: state, label: 'alt:', value: state.photo.alt),
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

class PhotoRow extends StatelessWidget {
  const PhotoRow({
    super.key,
    required this.state,
    required this.label,
    required this.value,
  });

  final PhotoState state;
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

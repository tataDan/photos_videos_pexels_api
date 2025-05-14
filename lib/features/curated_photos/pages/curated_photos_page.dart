import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/photos_widget.dart';
import '../providers/curated_photos_provider.dart';
import '../providers/curated_photos_state.dart';

class CuratedPhotosPage extends ConsumerStatefulWidget {
  const CuratedPhotosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CuratedPhotosPageState();
}

class _CuratedPhotosPageState extends ConsumerState<CuratedPhotosPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      ref.read(curatedPhotosProvider.notifier).getCuratedPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curated Photos Page')),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, WidgetRef ref, child) {
                final state = ref.watch(curatedPhotosProvider);
                if (state.isLoading && state.photosList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state.fetchCuratedPhotosError.isNotEmpty) {
                  return Center(
                    child: Text(
                      state.fetchCuratedPhotosError,
                      style: TextStyle(color: Colors.red, fontSize: 24.0),
                    ),
                  );
                }
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        !CuratedPhotosState().isLoading) {
                      ref
                          .read(curatedPhotosProvider.notifier)
                          .getCuratedPhotos();
                      return true;
                    }
                    return false;
                  },
                  child: ListView.builder(
                    primary: true,
                    itemCount: state.photosList.length,
                    itemBuilder: (context, index) {
                      return PhotosWidget(
                        photos: state.photosList,
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

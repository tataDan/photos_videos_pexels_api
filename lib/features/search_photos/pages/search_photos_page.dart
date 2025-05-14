import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/photos_widget.dart';
import '../providers/search_photos_provider.dart';
import '../providers/search_photos_state.dart';
import '../providers/search_text/photos_search_text_provider.dart';

class SearchPhotosPage extends ConsumerStatefulWidget {
  final String searchText;
  const SearchPhotosPage({super.key, required this.searchText});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchPhotosPageState();
}

class _SearchPhotosPageState extends ConsumerState<SearchPhotosPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future(() {
      ref
          .read(photosSearchTextProvider.notifier)
          .updateSearchText(widget.searchText);
      ref.read(searchPhotosProvider.notifier).getSearchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Photos Page')),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, WidgetRef ref, child) {
                ref.watch(photosSearchTextProvider);
                final state = ref.watch(searchPhotosProvider);
                if (state.isLoading && state.photosList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state.fetchSearchPhotosError.isNotEmpty) {
                  return Center(
                    child: Text(
                      'Fetching the photos failed for search text ${widget.searchText}.\nPlease ensure that'
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
                        !SearchPhotosState().isLoading) {
                      ref.read(searchPhotosProvider.notifier).getSearchPhotos();
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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/search_photos_api_service.dart';
import '../search_text/photos_search_text_provider.dart';

part 'search_photos_api_service_provider.g.dart';

@riverpod
SearchPhotosApiService searchPhotosApiService(Ref ref) {
  String searchText = ref.watch(photosSearchTextProvider);
  return SearchPhotosApiService(searchText);
}

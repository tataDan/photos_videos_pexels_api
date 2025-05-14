import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/search_photos_repository.dart';
import '../services/search_photos_api_service_provider.dart';

part 'search_photos_repository_provider.g.dart';

@riverpod
SearchPhotosRepository searchPhotosRepository(Ref ref) {
  return SearchPhotosRepository(
    searchPhotosApiService: ref.watch(searchPhotosApiServiceProvider),
  );
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photos_search_text_provider.g.dart';

@riverpod
class PhotosSearchText extends _$PhotosSearchText {
  @override
  String build() {
    return '';
  }

  void updateSearchText(String searchText) {
    state = searchText;
  }
}

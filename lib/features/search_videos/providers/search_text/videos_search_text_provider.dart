import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'videos_search_text_provider.g.dart';

@riverpod
class VideosSearchText extends _$VideosSearchText {
  @override
  String build() {
    return '';
  }

  void updateSearchText(String searchText) {
    state = searchText;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_id_provider.g.dart';

@riverpod
class PhotoId extends _$PhotoId {
  @override
  int build() {
    return 0;
  }

  void updateId(int id) {
    state = id;
  }
}

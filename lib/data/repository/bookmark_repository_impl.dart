import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final _ids = <int>{1, 2, 4};
  @override
  Future<void> clear() async {
    _ids.clear();
  }

  @override
  Future<List<int>> getBookmarkIds() async {
    return _ids.toList();
  }

  @override
  Future<void> save(int id) async {
    _ids.add(id);
  }

  @override
  Future<void> toggle(int id) async {
    if (_ids.contains(id)) {
      await unSave(id);
    } else {
      await save(id);
    }
  }

  @override
  Future<void> unSave(int id) async {
    _ids.remove(id);
  }
}

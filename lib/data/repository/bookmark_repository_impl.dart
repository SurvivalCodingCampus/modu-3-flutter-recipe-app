import 'package:recipe_app/domain/repository/repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final _mockData = <int>{1, 2, 3};

  @override
  Future<void> addId(int id) async {
    _mockData.add(id);
  }

  @override
  Future<void> deleteId(int id) async {
    _mockData.remove(id);
  }

  @override
  Future<List<int>> getIds() async {
    return _mockData.toList();
  }

  @override
  Future<void> toggle(int id) async {
    if (!_mockData.contains(id)) {
      await addId(id);
    }
    await deleteId(id);
  }
}

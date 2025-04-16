abstract interface class BookmarkRepository {
  Future<List<int>> getIds();

  Future<void> addId(int id);

  Future<void> deleteId(int id);

  Future<void> toggle(int id);
}

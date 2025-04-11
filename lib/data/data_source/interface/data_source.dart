abstract interface class DataSource<T> {
  Future<List<T>> fetch();
}

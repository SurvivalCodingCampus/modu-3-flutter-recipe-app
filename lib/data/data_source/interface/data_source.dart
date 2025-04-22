abstract interface class DataSource<T> {
  Future<T> fetch();
}

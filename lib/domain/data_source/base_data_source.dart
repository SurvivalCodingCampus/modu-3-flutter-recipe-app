abstract interface class BaseDataSource<T> {
  Future<T> findData(int id);
  Future<List<T>> findDatas();
}

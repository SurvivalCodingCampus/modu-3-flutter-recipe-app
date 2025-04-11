abstract interface class Repository<T, ID> {
  Future<T?> findById(ID id);
  Future<List<T>> findAll();
}

abstract interface class Repository<T, ID> {
  Future<T?> findById(ID id);
  Future<List<T>> findAll();
  Future<List<T>> findAllByFilter(bool Function(T predicate) predicate);
}

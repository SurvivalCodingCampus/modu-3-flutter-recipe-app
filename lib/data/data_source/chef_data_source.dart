abstract interface class ChefDataSource {
  Future<List<Map<String,dynamic>>> getChefs();
}
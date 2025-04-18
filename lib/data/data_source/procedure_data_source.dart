abstract interface class ProcedureDataSource {
  Future<List<Map<String, dynamic>>> getProcedures();
}
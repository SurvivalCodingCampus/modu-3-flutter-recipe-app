import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/data/repository/procedure_repository.dart';
import 'package:recipe_app/recipe_app/data_source/procedure_data_source.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _dataSource;

  ProcedureRepositoryImpl({required ProcedureDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Procedure>> fetchProcedure(int id) async {
    final procedureList = await _dataSource.getProcedureData();
    final procedure = procedureList.where((e) => e.recipeId == id).toList();
    return procedure;
  }
}

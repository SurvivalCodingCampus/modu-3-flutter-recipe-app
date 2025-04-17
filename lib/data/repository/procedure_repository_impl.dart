import 'package:recipe_app/data/data_source/data_source.dart';
import 'package:recipe_app/data/mapper/procedure_mapper.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  ProcedureRepositoryImpl({required ProcedureDataSource procedureDataSource})
    : _procedureDataSource = procedureDataSource;

  @override
  Future<List<Procedure>> getProcedures(int recipeId) async {
    final result = await _procedureDataSource.getProcedures();
    return result
        .where((e) => e.recipeId == recipeId)
        .map((e) => e.toProcedure())
        .toList();
  }
}

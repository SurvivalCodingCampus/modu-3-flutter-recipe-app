import 'package:recipe_app/data/data_source/procedure_data_source.dart';
import 'package:recipe_app/data/mepper/prcedures_mepper.dart';
import 'package:recipe_app/domain/model/procedure/procedure.dart';
import 'package:recipe_app/domain/roepositpry/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _dataSource;
  ProcedureRepositoryImpl({required ProcedureDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<List<Procedure>> getProcedureDto(int recipeId) {
    return _dataSource
        .getProcedureDtos(recipeId)
        .then((dtos) => dtos.map((e) => e.toProcedure()).toList());
  }
}

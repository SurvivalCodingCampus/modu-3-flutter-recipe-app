import 'package:recipe_app/data/data_source/procedure_data_source.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  const ProcedureRepositoryImpl({
    required ProcedureDataSource procedureDataSource,
  }) : _procedureDataSource = procedureDataSource;

  @override
  Future<List<Procedure>> getProcedures() async {
    final List<Map<String,dynamic>> procedures = await _procedureDataSource.getProcedures();
    return procedures.map((e) => Procedure.fromJson(e)).toList();
  }
}
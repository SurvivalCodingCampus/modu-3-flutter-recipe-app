
import 'package:recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:recipe_app/data/model/procedure.dart';
import 'package:recipe_app/data/repository/procedure/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  ProcedureRepositoryImpl(this._procedureDataSource);

  @override
  Future<List<Procedure>> getProcedure() {
    final procedure = _procedureDataSource.getProcedure();

    return procedure;
  }


}
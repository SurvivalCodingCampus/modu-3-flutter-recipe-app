import 'package:recipe_app/domain/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedures();
}
import 'package:recipe_app/data/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedure();

}
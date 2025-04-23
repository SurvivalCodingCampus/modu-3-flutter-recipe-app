import 'package:recipe_app/recipe_app/data/model/procedure.dart';

abstract class ProcedureRepository {
  Future<List<Procedure>> fetchProcedure(int id);
}

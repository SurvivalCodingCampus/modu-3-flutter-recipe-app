import 'package:recipe_app/domain/model/model.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedures(int recipeId);
}

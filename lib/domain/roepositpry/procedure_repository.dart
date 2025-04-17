import 'package:recipe_app/domain/model/procedure/procedure.dart';

abstract interface class ProcedureRepository {
  // 레시피 순서 정보 가져오기
  Future<List<Procedure>> getProcedureDto(int recipeId);
}

import 'package:recipe_app/data/dto/procedures_dto.dart';
import 'package:recipe_app/data/dto/user_dto.dart';

abstract interface class ProcedureDataSource {
  // 레시피순서 정보 가져오기
  Future<List<ProcedureDto>> getProcedureDtos(int recipeId);
}

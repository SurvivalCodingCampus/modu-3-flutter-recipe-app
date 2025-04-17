import 'package:recipe_app/data/dto/procedure_dto.dart';
import 'package:recipe_app/domain/model/procedure.dart';

extension ProcedureMapper on ProcedureDto {
  Procedure toProcedure() {
    return Procedure(
      step: step ?? -1,
      recipeId: recipeId ?? -1,
      content: content ?? '정보 없음',
    );
  }
}

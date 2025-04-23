import 'package:recipe_app/recipe_app/data/dto/procedure_dto.dart';
import 'package:recipe_app/recipe_app/data/model/procedure.dart';

extension ProcedureMapper on ProcedureDto {
  Procedure toProcedure() {
    return Procedure(
      recipeId: recipeId?.toInt() ?? 1,
      step: step?.toInt() ?? 1,
      content: content ?? '',
    );
  }
}

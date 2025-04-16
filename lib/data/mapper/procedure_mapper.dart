import 'package:recipe_app/data/dto/dto.dart';
import 'package:recipe_app/domain/model/model.dart';

extension ProcedureMapper on ProcedureDto {
  Procedure toProcedure() {
    return Procedure(
      recipeId: recipeId != null ? recipeId!.toInt() : 0,
      step: step != null ? step!.toInt() : 0,
      content: content ?? '',
    );
  }
}

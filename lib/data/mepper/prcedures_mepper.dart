import 'package:recipe_app/data/dto/procedures_dto.dart';
import 'package:recipe_app/domain/model/procedure/procedure.dart';

extension PrceduresMepper on ProcedureDto {
  Procedure toProcedure() {
    return Procedure(
      recipeId: recipeId ?? -1,
      step: step?.toInt() ?? -1,
      content: content ?? '',
    );
  }
}

import '../dto/procedure_dto.dart';
import '../model/procedure_model.dart';

extension ProcedureMapper on ProcedureStepDto {
  Procedure toProcedure() {
    return Procedure(recipeId: recipeId ?? 0, steps: [content ?? '']);
  }

  static List<Procedure> fromDtoList(
    List<ProcedureStepDto> dtos,
    int recipeId,
  ) {
    return dtos
        .where((dto) => dto.recipeId == recipeId)
        .map((dto) => dto.toProcedure())
        .toList();
  }
}

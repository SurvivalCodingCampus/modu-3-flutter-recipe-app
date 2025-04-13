import '../dto/procedure_dto.dart';
import '../model/procedure_model.dart';

extension ProcedureMapper on ProcedureStepDto {
  Procedure toProcedure() {
    final validRecipeId = recipeId ?? 0;
    final step = content ?? '';
    return Procedure(recipeId: validRecipeId, steps: [step]);
  }

  static List<Procedure> fromDtoList(
    List<ProcedureStepDto> dtos,
    int recipeId,
  ) {
    if (dtos.isEmpty) {
      return [];
    }
    return dtos
        .where((dto) => dto.recipeId == recipeId)
        .map((dto) => dto.toProcedure())
        .toList();
  }

  // static Procedure combineStepsFromDtoList(
  //   List<ProcedureStepDto> dtos,
  //   int recipeId,
  // ) {
  //   if (dtos.isEmpty) {
  //     return Procedure(recipeId: recipeId, steps: []);
  //   }
  //
  //   final filteredDtos = dtos.where((dto) => dto.recipeId == recipeId);
  //   final steps = filteredDtos
  //       .map((dto) => dto.content ?? '')
  //       .where((content) => content.isNotEmpty)
  //       .toList();
  //
  //   return Procedure(recipeId: recipeId, steps: steps);
  // }
}

import 'package:recipe_app/data/dto/step_dto.dart';
import 'package:recipe_app/domain/model/step.dart';

extension StepMapper on StepDto {
  Step toStep() {
    return Step(
      recipeId: recipeId!.toInt(),
      step: step!.toInt(),
      content: content ?? '',
    );
  }
}

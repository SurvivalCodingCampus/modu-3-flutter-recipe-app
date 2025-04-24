import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/ingredient.dart';

part 'detail_recipe_action.freezed.dart';

@freezed
sealed class DetailRecipeAction with _$DetailRecipeAction {
  const factory DetailRecipeAction.getRecipeById(int id) = GetRecipeById;

  const factory DetailRecipeAction.getProcedureById(int id) = GetProcedureById;

  const factory DetailRecipeAction.getIngredients() = GetIngredients;
}

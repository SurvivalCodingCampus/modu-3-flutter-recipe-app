import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_recipe_action.freezed.dart';

@freezed
sealed class DetailRecipeAction with _$DetailRecipeAction {
  const factory DetailRecipeAction.getRecipeById(int id) = GetRecipeById;

  const factory DetailRecipeAction.getProcedureById(int id) = GetProcedureById;

  const factory DetailRecipeAction.getIngredients() = GetIngredients;

  const factory DetailRecipeAction.copyLink(int id) = CopyLink;

  const factory DetailRecipeAction.getCopyLink(int id) = GetCopyLink;
}

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'saved_recipe_action.freezed.dart';

@freezed
sealed class SavedRecipeAction with _$SavedRecipeAction {
  const factory SavedRecipeAction.fetchSavedRecipe() = FetchSavedRecipe;
  const factory SavedRecipeAction.setRecipeCardState(Recipe recipe) =
      SetRecipeCardState;
  const factory SavedRecipeAction.removeToggle(int targetRecipeId) =
      RemoveToggle;
}

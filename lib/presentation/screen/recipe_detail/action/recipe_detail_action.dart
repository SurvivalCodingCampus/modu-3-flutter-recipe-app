import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_popup_menu.dart';

part 'recipe_detail_action.freezed.dart';

@freezed
sealed class RecipeDetailAction with _$RecipeDetailAction {
  const factory RecipeDetailAction.fetchRecipe(int recipeId) = FetchRecipe;
  const factory RecipeDetailAction.changeTabIndex(int index) = ChangeTabIndex;
  const factory RecipeDetailAction.onTapMenu(PopupItem menu) = OnTapMenu;
}

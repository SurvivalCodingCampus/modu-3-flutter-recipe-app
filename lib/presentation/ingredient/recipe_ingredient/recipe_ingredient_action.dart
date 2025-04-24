import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient_action.freezed.dart';

@freezed
sealed class RecipeIngredientAction with _$RecipeIngredientAction {
  const factory RecipeIngredientAction.onBookmark(int id) = OnBookmark;
  const factory RecipeIngredientAction.onTabSelect(int index) = OnTabSelect;
  const factory RecipeIngredientAction.onRating() = OnRating;
}
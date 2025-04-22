import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.tapRecipe(int recipeId) = TapRecipe;
  const factory HomeAction.selectCategory(int index) = SelectCategory;
  const factory HomeAction.toggleBookmark(Recipe recipe) = ToggleBookmark;
  const factory HomeAction.searchTouch() = SearchTouch;
}

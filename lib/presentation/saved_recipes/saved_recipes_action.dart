import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onTapRecipe(Recipe recipe) = OnTapRecipe;
  const factory SavedRecipesAction.onTapFavorite(int recipeId) = OnTapFavorite;
  const factory SavedRecipesAction.onRetry() = OnRetry;
  const factory SavedRecipesAction.onClearError() = OnClearError;
}

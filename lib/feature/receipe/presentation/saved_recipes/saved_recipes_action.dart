import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_action.freezed.dart';
part 'saved_recipes_action.g.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.fetchRecipes() = FetchRecipes;
  const factory SavedRecipesAction.bookmarkRecipe(int id) = BookmarkRecipe;

  factory SavedRecipesAction.fromJson(Map<String, dynamic> json) =>
      _$SavedRecipesActionFromJson(json);
}

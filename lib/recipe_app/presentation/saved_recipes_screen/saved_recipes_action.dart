import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.removeBookMark(int id) = RemoveBookMark;

  const factory SavedRecipesAction.addBookMark(Recipe recipe) = AddBookMark;
}

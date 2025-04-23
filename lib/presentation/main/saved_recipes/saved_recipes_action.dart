import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onBookmark(int id) = OnBookmark;
  const factory SavedRecipesAction.onRecipeClick(int id) = OnRecipeClick;
}
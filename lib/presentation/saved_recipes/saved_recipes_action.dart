import 'package:freezed_annotation/freezed_annotation.dart';
part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onCardClick(int cardId) = OnCardClick;
  const factory SavedRecipesAction.onBookmarkClick(int bookmarkId) =
      OnBookmarkClick;
  const factory SavedRecipesAction.findRecipes() = FindRecipes;
}

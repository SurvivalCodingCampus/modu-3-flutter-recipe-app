import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onSearchTap() = OnSearchTap;
  const factory HomeAction.onCategoryClick(String category) = OnCategoryClick;
  const factory HomeAction.findRecipes() = FindRecipes;
  const factory HomeAction.onBookmarkClick(int recipeId) = OnBookmarkClick;
}

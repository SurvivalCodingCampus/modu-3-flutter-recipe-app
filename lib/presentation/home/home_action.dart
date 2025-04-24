import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onSearchTap() = OnSearchTap;
  const factory HomeAction.onSelectTap(int index) = OnSelectTap;
  const factory HomeAction.onRecipeTap(Recipe recipe) = OnRecipeTap;
  const factory HomeAction.onBookmarkTap(int recipeId) = OnBookmarkTap;
}

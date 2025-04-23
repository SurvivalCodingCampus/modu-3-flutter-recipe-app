import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_action.freezed.dart';

@freezed
sealed class RecipeDetailAction with _$RecipeDetailAction {
  const factory RecipeDetailAction.onRate(int rating) = OnRate;
  const factory RecipeDetailAction.onRetry() = OnRetry;
  const factory RecipeDetailAction.onSelectTab(int index) = OnSelectTab;
}

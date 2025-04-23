import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipe_action.freezed.dart';

@freezed
sealed class SearchRecipeAction with _$SearchRecipeAction {
  const factory SearchRecipeAction.searchRecipe(String keyword) = SearchRecipe;
  const factory SearchRecipeAction.showFilter() = ShowFilter;
}

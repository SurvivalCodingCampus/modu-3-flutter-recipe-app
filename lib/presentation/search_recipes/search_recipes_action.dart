import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/presentation/search_recipes/filter_state.dart';
part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.search(String value) = Search;
  const factory SearchRecipesAction.searchFilter(FilterState state) =
      SearchFilter;
  const factory SearchRecipesAction.findRecipes() = FindRecipes;
}

// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/screen/search_recipes/state/filter_search_state.dart';

part 'search_recipe_state.freezed.dart';

@freezed
class SearchRecipeState with _$SearchRecipeState {
  final List<Recipe> searchRecipes;
  final bool isLoading;
  final List<Recipe> filterRecipes;
  final String keyword;
  final FilterSearchState filterSearchState;

  SearchRecipeState({
    this.searchRecipes = const [],
    this.filterRecipes = const [],
    this.isLoading = false,
    this.keyword = '',
    this.filterSearchState = const FilterSearchState(),
  });
}

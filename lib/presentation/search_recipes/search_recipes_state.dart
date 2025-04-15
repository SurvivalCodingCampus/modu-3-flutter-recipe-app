import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipe_model.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> filteredRecipes;
  final List<Recipe> recipes;
  final bool isLoading;
  final bool isFiltered;
  final String keyword;

  const SearchRecipesState({
    this.filteredRecipes = const [],
    this.recipes = const [],
    this.isLoading = false,
    this.keyword = '',
    this.isFiltered = false,
  });
}

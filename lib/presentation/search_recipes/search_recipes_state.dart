import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;
  final List<Recipe> filterRecipes;
  final String searchKeyword;
  final bool isLoading;

  const SearchRecipesState({
    this.recipes = const [],
    this.filterRecipes = const [],
    this.searchKeyword = '',
    this.isLoading = false,
  });
}

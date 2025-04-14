import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/model/recipe/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;
  final List<Recipe> filterRecipes;
  final String searchKeyWord;
  final bool searchState;
  final bool isSearchLoading;

  const SearchRecipesState({
    this.recipes = const [],
    this.filterRecipes = const [],
    this.searchState = false,
    this.searchKeyWord = '',
    this.isSearchLoading = false,
  });
}

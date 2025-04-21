import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;     //전체데이터
  final String searchKeyword;     // 현재 검색어
  final List<Recipe> filteredRecipes;

  final bool isLoading;

  const SearchRecipesState({
    this.recipes = const [],
    this.searchKeyword = '',
    this.filteredRecipes = const [],
    this.isLoading = false,
  });
}
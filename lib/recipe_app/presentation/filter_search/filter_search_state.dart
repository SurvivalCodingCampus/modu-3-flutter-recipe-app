import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  final List<Recipe> recipes;
  final bool isRecipesLoading;
  final List<String> filters;
  final List<Recipe> filteredRecipes;

  const FilterSearchState({
    this.recipes = const [],
    this.isRecipesLoading = false,
    this.filters = const [],
    this.filteredRecipes = const [],
  });
}

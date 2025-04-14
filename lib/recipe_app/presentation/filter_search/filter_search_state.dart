import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'filter_searrch_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  final List<Recipe> recipes;
  final bool isRecipesLoading;
  final String filter;
  final List<Recipe> filteredRecipes;

  const FilterSearchState({
    this.recipes = const [],
    this.isRecipesLoading = false,
    this.filter = '',
    this.filteredRecipes = const [],
  });
}

import 'package:recipe_app/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;
  final List<Recipe> searchRecipes;
  final bool isLoading;
  final String searchString;


  const SearchRecipesState({
    this.recipes = const [],
    this.searchRecipes = const [],
    this.isLoading = false,
    this.searchString = '',

  });
}

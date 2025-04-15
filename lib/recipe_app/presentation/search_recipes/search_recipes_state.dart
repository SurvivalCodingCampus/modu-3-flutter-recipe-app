import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;
  final String keyword;
  final bool isRecipesLoading;
  final List<Recipe> searchRecipes;

  const SearchRecipesState({
    this.recipes = const [],
    this.keyword = '',
    this.isRecipesLoading = false,
    this.searchRecipes = const [],
  });
}

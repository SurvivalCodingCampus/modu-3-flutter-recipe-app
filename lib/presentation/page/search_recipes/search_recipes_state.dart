import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  @override
  final List<Recipe> recipes;
  @override
  final List<Recipe> filterRecipes;
  @override
  final String searchKeyWord;
  @override
  final bool searchState;
  @override
  final bool isSearchLoading;

  const SearchRecipesState({
    this.recipes = const [],
    this.filterRecipes = const [],
    this.searchState = false,
    this.searchKeyWord = '',
    this.isSearchLoading = false,
  });
}

import 'package:flutter/material.dart';
import 'package:recipe_app/core/enums/time_filter.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  // 상태
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    _state = state.copyWith(isLoading: true);
  }

  void fetchRecipes() async {
    final List<Recipe> recipes = await _recipeRepository.getRecipes();
    _state = state.copyWith(searchRecipes: recipes, recipes: recipes);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void searchRecipes() async {
    final List<Recipe> filteredRecipes =
        state.recipes
            // 카테고리 필터링
            .where((recipe) {
              if(state.categoryFilter == CategoryFilter.All) {
                return true;
              }
              return recipe.category == state.categoryFilter;
            })

            // Rate 별점 필터링
            .where((recipe) {
              if(state.rateFilter == 5) {
                return recipe.rating >= 5.0;
              } else if (state.rateFilter == 4) {
                return 4.0 <= recipe.rating && recipe.rating < 5.0;
              } else if (state.rateFilter == 3) {
                return 3.0 <= recipe.rating && recipe.rating < 4.0;
              } else if (state.rateFilter == 2) {
                return 2.0 <= recipe.rating && recipe.rating < 3.0;
              } else if (state.rateFilter == 1) {
                return 1.0 <= recipe.rating && recipe.rating < 2.0;
              }
              return true;
            })
            /*
            .where((recipe) {
              return TimeFilter
            })
            */
            .toList();
    final List<Recipe> searchRecipes =
        filteredRecipes
            .where(
              (recipe) =>
                  recipe.name.toLowerCase().contains(state.searchString.toLowerCase()) ||
                  recipe.chef.toLowerCase().contains(state.searchString.toLowerCase()),
            )
            .toList();
    _state = state.copyWith(searchRecipes: searchRecipes);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void setFilter(
    TimeFilter timeFilter,
    int rateFilter,
    CategoryFilter categoryFilter,
  ) async {
    _state = state.copyWith(
      timeFilter: timeFilter,
      rateFilter: rateFilter,
      categoryFilter: categoryFilter,
    );
    notifyListeners();
    searchRecipes();
  }

  void updateSearchString(String value) async {
    _state = state.copyWith(searchString: value);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recent_search_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:recipe_app/presentation/component/filter_search_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final RecentSearchRepository _recentSearchRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  // 상태
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel({
    required RecipeRepository recipeRepository,
    required RecentSearchRepository recentSearchRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _recipeRepository = recipeRepository,
       _recentSearchRepository = recentSearchRepository,
       _searchRecipesUseCase = searchRecipesUseCase {
    _state = state.copyWith(isLoading: true);
  }

  void fetchRecipes() async {
    final List<Recipe> recipes = await _recipeRepository.getRecipes();
    final List<Recipe> recentSearch =
        await _recentSearchRepository.getRecentSearch();

    if (recentSearch.isEmpty) {
      _state = state.copyWith(searchRecipes: recipes, recipes: recipes);
    } else {
      _state = state.copyWith(searchRecipes: recentSearch, recipes: recipes);
    }

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void searchRecipes() async {
    final List<Recipe> searchRecipes = await _searchRecipesUseCase.execute(
      state.recipes,
      state.searchString,
      state.filterSearchState,
    );

    _state = state.copyWith(searchRecipes: searchRecipes);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void setFilter(FilterSearchState filterSearchState) async {
    _state = state.copyWith(filterSearchState: filterSearchState);
    searchRecipes();
    notifyListeners();
  }

  void updateSearchString(String value) async {
    _state = state.copyWith(searchString: value);
    notifyListeners();
  }
}

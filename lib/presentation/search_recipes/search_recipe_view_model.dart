import 'package:flutter/cupertino.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_state.dart';


class SearchRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipeViewModel(this._recipeRepository);

  SearchRecipeState _state = SearchRecipeState(
    recipes: [],
    keyword: '',
    isLoading: false,
    filterRecipes: [],
  );

  SearchRecipeState get state => _state;

  FilterSearchState _filterSearchState = FilterSearchState();
  FilterSearchState get filterSearchState => _filterSearchState;


  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );

    notifyListeners();
  }
  void searchKeyword(String keyword) {
    _state = _state.copyWith(keyword: keyword);
    selectedFilter();
  }
  void updateFilterState(FilterSearchState newState) {
    _filterSearchState = newState;
    selectedFilter();
  }
  void selectedFilter() {
    final keyword = _state.keyword.toLowerCase().trim();
    final rate = _filterSearchState.rate;

    final filtered = _state.recipes.where((recipe) {
      final matchKeyword = keyword.isEmpty || recipe.name.toLowerCase().contains(keyword);
      final matchRate = recipe.rating >= rate;
      return matchKeyword && matchRate;
    }).toList();

    _state = _state.copyWith(filterRecipes: filtered);
    notifyListeners();
  }
}

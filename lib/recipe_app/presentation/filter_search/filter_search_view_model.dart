import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';

import 'filter_search_state.dart';

class FilterSearchViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  FilterSearchState _filterSearchState = const FilterSearchState();

  RecipeRepository get recipeRepository => _recipeRepository;

  FilterSearchViewModel(this._recipeRepository);

  FilterSearchState get filterSearchState => _filterSearchState;

  //view에서 모든 레시피 가져오는 메서드
  Future<void> fetchRecipes() async {
    _filterSearchState = filterSearchState.copyWith(isRecipesLoading: true);
    notifyListeners();
    _filterSearchState = _filterSearchState.copyWith(
      recipes: await recipeRepository.fetchRecipes(),
      isRecipesLoading: false,
    );
    notifyListeners();
  }

  //view에서 검색어가 포함된 레시피 가져오는 메서드
  Future<void> filterRecipes(String filter) async {
    _filterSearchState = filterSearchState.copyWith(isRecipesLoading: true);
    notifyListeners();
    _filterSearchState = _filterSearchState.copyWith(
      recipes: await recipeRepository.searchRecipes(filter),
      isRecipesLoading: false,
    );
    notifyListeners();
  }
}

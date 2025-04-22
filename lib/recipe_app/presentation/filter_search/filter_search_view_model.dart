import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/domain/use_case/filter_category_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_event.dart';

import 'filter_search_state.dart';

class FilterSearchViewModel with ChangeNotifier {
  final FilterCategoryUseCase _useCase;
  final RecipeRepository _recipeRepository;

  FilterCategoryUseCase get useCase => _useCase;
  FilterSearchState _filterSearchState = const FilterSearchState();

  FilterSearchViewModel({
    required FilterCategoryUseCase useCase,
    required RecipeRepository recipeRepository,
  }) : _useCase = useCase,
       _recipeRepository = recipeRepository;

  FilterSearchState get filterSearchState => _filterSearchState;

  final _eventController = StreamController<FilterSearchEvent>();

  Stream<FilterSearchEvent> get eventStream => _eventController.stream;

  List<Recipe> get recipes => _recipes;
  List<Recipe> _recipes = [];

  List<Recipe> get filteredRecipes => _filteredRecipes;
  List<Recipe> _filteredRecipes = [];

  //view에서 모든 레시피 가져오는 메서드

  Future<void> fetchRecipes() async {
    _filterSearchState = filterSearchState.copyWith(isRecipesLoading: true);
    notifyListeners();
    _filterSearchState = _filterSearchState.copyWith(
      recipes: await _recipeRepository.fetchRecipes(),
      isRecipesLoading: false,
    );
    notifyListeners();
  }

  //view에서 검색어가 포함된 레시피 가져오는 메서드
  Future<void> filterRecipesByCategory(
    String time,
    int rate,
    String category,
  ) async {
    try {
      _filterSearchState = filterSearchState.copyWith(isRecipesLoading: true);
      notifyListeners();

      final filtered = await _useCase.execute(time, rate, category);
      _filteredRecipes = filtered;
      _filterSearchState = _filterSearchState.copyWith(
        filteredRecipes: filtered,
        isRecipesLoading: false,
      );
      _eventController.add(FilterSearchEvent.success(_filterSearchState));
      notifyListeners();
    } catch (e) {
      _eventController.add(FilterSearchEvent.showErrorMessage('필터링 오류'));
    }

    print('${_filterSearchState.filteredRecipes.length}개 존재');
  }
}

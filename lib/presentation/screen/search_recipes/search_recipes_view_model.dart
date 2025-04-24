import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/use_case/recipe/filter_serch_recipe_use_case.dart';
import 'package:recipe_app/domain/use_case/recipe/get_search_recipe_use_case.dart';
import 'package:recipe_app/domain/use_case/recipe/save_serch_recipe_use_case.dart';

import 'package:recipe_app/presentation/screen/search_recipes/state/search_recipe_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetSearchRecipeUseCase _getSearchRecipeUseCase;
  final SaveSerchRecipeUseCase _saveSerchRecipeUseCase;
  final FilterSerchRecipeUseCase _filterSerchRecipeUseCase;

  SearchRecipesViewModel({
    required GetSearchRecipeUseCase getSearchRecipeUseCase,
    required SaveSerchRecipeUseCase saveSerchRecipeUseCase,
    required FilterSerchRecipeUseCase filterSerchRecipeUseCase,
  }) : _saveSerchRecipeUseCase = saveSerchRecipeUseCase,
       _getSearchRecipeUseCase = getSearchRecipeUseCase,
       _filterSerchRecipeUseCase = filterSerchRecipeUseCase;

  SearchRecipeState _state = SearchRecipeState();
  SearchRecipeState get state => _state;

  // 레시피 가져오기
  Future<void> fetchRecipe() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final searchRecipes = await _getSearchRecipeUseCase.execute();

    _state = state.copyWith(
      isLoading: false,
      searchRecipes: searchRecipes,
      filterRecipes: searchRecipes,
    );

    notifyListeners();
  }

  // 검색어 기반의검색 필터링
  Future<void> searchRecipe(String keyword) async {
    _state = state.copyWith(isLoading: true, keyword: keyword);
    notifyListeners();

    // 검색된 레시피 내용 저장후 상태 변경
    final filterRecipes = await _saveSerchRecipeUseCase.execute(state.keyword);
    _state = state.copyWith(isLoading: false, filterRecipes: filterRecipes);
    notifyListeners();
  }

  // 필터 클릭시 상태 변경하기
  void updateFilterSearchState({Time? time, int? rate, Category? category}) {
    final currentFilterState = state.filterSearchState;

    final newFilterState = currentFilterState.copyWith(
      time: time ?? currentFilterState.time,
      rate: rate ?? currentFilterState.rate,
      category: category ?? currentFilterState.category,
    );

    _state = state.copyWith(filterSearchState: newFilterState);
    notifyListeners();
  }

  void filterSearchRecipe() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final filterRecipes = await _filterSerchRecipeUseCase.execute(
      recipes: state.searchRecipes,
      keyword: state.keyword,
      rate: state.filterSearchState.rate.toDouble(),
      sortTime: state.filterSearchState.time,
      category: state.filterSearchState.category,
    );
    _state = state.copyWith(isLoading: false, filterRecipes: filterRecipes);
    notifyListeners();
  }
}

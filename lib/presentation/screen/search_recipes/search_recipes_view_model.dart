import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/filter/filter_enum.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/screen/search_recipes/state/search_recipe_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  SearchRecipesViewModel({required RecipeRepository repository})
    : _repository = repository;

  SearchRecipeState _state = SearchRecipeState();
  SearchRecipeState get state => _state;

  // 레시피 가져오기
  Future<void> fetchRecipe() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final searchRecipes = await _repository.getRecipes();

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

    _state = state.copyWith(
      isLoading: false,
      filterRecipes:
          state.searchRecipes
              .where(
                (recipe) =>
                    recipe.title.toLowerCase().contains(keyword.toLowerCase()),
              )
              .toList(),
    );
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

    List<Recipe> filteredRecipes = state.searchRecipes;

    // 1. 키워드 필터링
    if (state.keyword.isNotEmpty) {
      filteredRecipes =
          filteredRecipes.where((recipe) {
            return recipe.title.toLowerCase().contains(
              state.keyword.toLowerCase(),
            );
          }).toList();
    }

    // 2. 별점 필터링
    if (state.filterSearchState.rate > 0) {
      filteredRecipes =
          filteredRecipes.where((recipe) {
            // 필터에서 선택된 rate 값
            final rate = state.filterSearchState.rate.toDouble();

            // 범위: rate ≤ adjustedRating < rate + 1
            return recipe.rating >= rate && recipe.rating < rate + 1;
          }).toList();
    }

    // 3. 시간 정렬 (최신순, 오래된순, 인기순)
    switch (state.filterSearchState.time) {
      case Time.newest:
        filteredRecipes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case Time.oldest:
        filteredRecipes.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case Time.popularity:
        filteredRecipes.sort((b, a) => a.rating.compareTo(b.rating));
        break;
      default:
        break;
    }

    // 4 카테고리 필터링
    if (state.filterSearchState.category != Category.all) {
      filteredRecipes =
          filteredRecipes.where((recipe) {
            return recipe.category == state.filterSearchState.category;
          }).toList();
    }

    _state = state.copyWith(isLoading: false, filterRecipes: filteredRecipes);
    notifyListeners();
  }
}

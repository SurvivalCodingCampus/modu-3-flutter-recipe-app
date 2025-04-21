// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/search_data.dart';
import 'package:recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:recipe_app/domain/usecase/get_search_data_use_case.dart';
import 'package:recipe_app/domain/usecase/update_search_data_use_case.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  // final RecipeRepository _repository;
  final GetRecipesUseCase _getRecipesUseCase;
  final UpdateSearchDataUseCase _updateSearchDataUseCase;
  final GetSearchDataUseCase _getSearchDataUseCase;

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel({
    required GetRecipesUseCase getRecipesUseCase,
    required UpdateSearchDataUseCase updateSearchDataUseCase,
    required GetSearchDataUseCase getSearchDataUseCase,
  }) : _getRecipesUseCase = getRecipesUseCase,
       _updateSearchDataUseCase = updateSearchDataUseCase,
       _getSearchDataUseCase = getSearchDataUseCase;

  Future<void> load() async {
    _state = state.copyWith(recipes: const UiState.loading());
    notifyListeners();

    try {
      final result = await _getRecipesUseCase.execute();

      switch (result) {
        case UiEmpty():
          break;
        case UiSuccess(data: final recipes):
          final searchData = await _getSearchDataUseCase.execute();

          _state = _state.copyWith(
            recipes:
                recipes.isEmpty
                    ? const UiState.empty()
                    : UiState.success(recipes),
            filtered: recipes,
          );

          if (searchData case UiSuccess(:final data)) {
            _loadSearchData(data);
          }

        case UiError(message: final message):
          _state = _state.copyWith(recipes: UiState.error(message));
        case UiLoading():
          break;
      }
    } catch (e) {
      _state = _state.copyWith(recipes: const UiState.error('예상치 못한 오류가 발생'));
      debugPrint('load() failed: $e');
    }

    notifyListeners();
  }

  void _loadSearchData(SearchData data) {
    final List<FilterCategory> searchDataCategories = [];

    if (data.categories != null) {
      for (final str in data.categories as List<String>) {
        searchDataCategories.add(str.toFilterCategory());
      }
    }

    _applyFilterAndQuery(
      query: data.query ?? '',
      filter: FilterSearchState(
        rate: data.rate,
        categories: searchDataCategories,
      ),
    );
  }

  void _applyFilterAndQuery({
    required String query,
    required FilterSearchState filter,
  }) {
    final current = _state.recipes;

    if (current case UiSuccess(data: final allRecipes)) {
      final isAllSelected = filter.categories.contains(FilterCategory.all);

      final filtered =
          allRecipes.where((recipe) {
            // 카테고리 필터
            final matchCategory =
                filter.categories.isEmpty ||
                isAllSelected ||
                filter.categories
                    .map((e) => e.name.toLowerCase())
                    .contains(recipe.category.toLowerCase());

            // 레시피 평점 필터
            final matchRate =
                filter.rate == null ||
                (recipe.rating >= filter.rate! &&
                    recipe.rating < filter.rate! + 1);

            // 레시피 이름 필터
            final matchQuery =
                query.isEmpty ||
                recipe.name.toLowerCase().contains(query.toLowerCase());

            return matchCategory && matchRate && matchQuery;
          }).toList();

      final cleanedFilter =
          isAllSelected ? filter.copyWith(categories: []) : filter;

      _state = _state.copyWith(
        filtered: filtered,
        query: query,
        filterSearchState: cleanedFilter,
      );

      notifyListeners();
    }
  }

  void updateQuery(String query) {
    _applyFilterAndQuery(query: query, filter: _state.filterSearchState);
  }

  void applyFilter(FilterSearchState filter) {
    _applyFilterAndQuery(query: _state.query, filter: filter);
  }

  @override
  void dispose() {
    _updateSearchDataUseCase.execute(
      query: _state.query,
      rate: _state.filterSearchState.rate,
      categories: _state.filterSearchState.categories,
    );
    super.dispose();
  }
}

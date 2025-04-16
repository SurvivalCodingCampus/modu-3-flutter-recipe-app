// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/ui/ui_state.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._repository);

  Future<void> load() async {
    _state = state.copyWith(recipes: const UiState.loading());
    notifyListeners();

    try {
      final result = await _repository.getRecipes();

      switch (result) {
        case Success(data: final recipes):
          _state = _state.copyWith(
            recipes:
                recipes.isEmpty
                    ? const UiState.empty()
                    : UiState.success(recipes),
            filtered: recipes,
          );
          break;

        case Error(failure: final failure):
          _state = _state.copyWith(recipes: UiState.error(failure.message));
          break;
      }
    } catch (e) {
      _state = _state.copyWith(recipes: const UiState.error('예상치 못한 오류가 발생'));
      debugPrint('load() failed: $e');
    }

    notifyListeners();
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
    // final current = _state.recipes;
    //
    // if (current case UiSuccess()) {
    //   final filtered =
    //       query.isEmpty
    //           ? _state.filtered
    //           : _state.filtered
    //               .where(
    //                 (r) => r.name.toLowerCase().contains(query.toLowerCase()),
    //               )
    //               .toList();
    //
    //   _state = _state.copyWith(query: query, filtered: filtered);
    //
    //   notifyListeners();
    // }
  }

  void applyFilter(FilterSearchState filter) {
    _applyFilterAndQuery(query: _state.query, filter: filter);
    // final current = _state.recipes;
    //
    // if (current case UiSuccess()) {
    //   final isAllSelected = filter.categories.contains(FilterCategory.all);
    //
    //   final filtered =
    //       _state.filtered.where((recipe) {
    //         final matchCategory =
    //             filter.categories.isEmpty ||
    //             isAllSelected ||
    //             filter.categories.contains(FilterCategory.all) ||
    //             filter.categories
    //                 .map((e) => e.name.toLowerCase())
    //                 .contains(recipe.category.toLowerCase());
    //
    //         /*
    //         final matchRate =
    //             filter.rate == null || recipe.rating >= filter.rate!; // rating 보다 높은 레시피 점색
    //         */
    //         final matchRate =
    //             filter.rate == null ||
    //             (recipe.rating >= filter.rate! &&
    //                 recipe.rating < filter.rate! + 1); // rating 점수대 레시피 검색
    //
    //         return matchCategory && matchRate;
    //       }).toList();
    //
    //   final cleanedFilter =
    //       isAllSelected ? filter.copyWith(categories: []) : filter;
    //
    //   _state = _state.copyWith(
    //     filtered: filtered,
    //     filterSearchState: cleanedFilter,
    //   );
    //
    //   notifyListeners();
    // }
  }
}

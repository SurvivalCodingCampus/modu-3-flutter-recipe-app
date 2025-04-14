import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/repository/search/search_recipe_repository.dart';
import 'package:recipe_app/presentation/pages/recipe/search/state/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final SearchRecipeRepository _searchRepository;

  SearchViewModel(this._searchRepository);

  SearchState _state = const SearchState();
  SearchState get state => _state;

  void fetchSearchData() async {
    try {
      _state = state.copyWith(viewState: ViewState.loading);
      notifyListeners();
      final response = await _searchRepository.getRecipes();
      switch (response) {
        case Success<List<Recipe>>():
          _state = state.copyWith(
            data: response.data,
            originalData: response.data,
            viewState: ViewState.complete,
          );
        case Error<List<Recipe>>():
          _state = state.copyWith(viewState: ViewState.error);
      }
      notifyListeners();
    } catch (e) {
      _state = state.copyWith(viewState: ViewState.error);
    }
  }

  void filterData({
    required String time,
    required int rate,
    required String category,
  }) {
    // time은 뭘 원하는지 모르겠어서 패스
    _state = state.copyWith(
      data:
          _state.originalData.where((e) {
            // 기본 필터 조건을 먼저 설정
            final isRatingValid =
                rate == 0 || (e.rating >= rate && e.rating < rate + 1);
            final isCategoryValid = category == 'All' || e.category == category;

            // 두 조건이 모두 만족하는 경우만 반환
            return isRatingValid && isCategoryValid;
          }).toList(),
      viewState: ViewState.complete,
      isFiltered: true,
    );
    notifyListeners();
  }

  void searchData(String text) {
    _state = state.copyWith(searchText: text);
    if (text.isEmpty) {
      _state = state.copyWith(
        data: _state.originalData,
        viewState: ViewState.complete,
        isFiltered: false,
      );
    } else {
      _state = state.copyWith(
        data: _state.originalData.where((e) => e.name.contains(text)).toList(),
        viewState: ViewState.complete,
        isFiltered: true,
      );
    }
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_recent_search_text_use_case.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_saved_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/save_recent_search_text_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final GetRecentSearchTextUseCase _getRecentSearchTextUseCase;
  final SaveRecentSearchTextUseCase _saveRecentSearchTextUseCase;

  SearchViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required GetRecentSearchTextUseCase getRecentSearchTextUseCase,
    required SaveRecentSearchTextUseCase saveRecentSearchTextUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _getRecentSearchTextUseCase = getRecentSearchTextUseCase,
       _saveRecentSearchTextUseCase = saveRecentSearchTextUseCase;

  SearchState _state = const SearchState();
  SearchState get state => _state;

  // UI 변경 유무 상태값
  bool get isChangeUI => _state.isFiltered || _state.searchText.isNotEmpty;

  void fetchSearchData() async {
    try {
      _state = state.copyWith(viewState: ViewState.loading);
      notifyListeners();
      final response = await _getSavedRecipesUseCase.excute();
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
    // 필터링된 데이터
    final filteredData =
        _state.originalData.where((e) {
          // 기본 필터 조건을 먼저 설정
          final isRatingValid =
              rate == 0 || (e.rating >= rate && e.rating < rate + 1);
          final isCategoryValid = category == 'All' || e.category == category;

          // 두 조건이 모두 만족하는 경우만 반환
          return isRatingValid && isCategoryValid;
        }).toList();

    // time은 뭘 원하는지 모르겠어서 작성 X
    _state = state.copyWith(
      // 필터링 데이터와 뷰에 보여질 데이터 저장
      filteredData: filteredData,
      data: filteredData,
      viewState: ViewState.complete,
      // 하나라도 필터링이 걸려있다면 true
      isFiltered: rate != 0 || category != 'All',
    );
    notifyListeners();
  }

  void searchData(String text) {
    _state = state.copyWith(searchText: text);
    // 현재 필터링됐는지 안됐는지에 따라
    // 다르게 기본 베이스 데이터를 설정
    List<Recipe> baseData = _state.originalData;
    if (_state.isFiltered) {
      baseData = _state.filteredData;
    }
    if (text.isEmpty) {
      _state = state.copyWith(data: baseData, viewState: ViewState.complete);
    } else {
      _state = state.copyWith(
        data: baseData.where((e) => e.name.contains(text)).toList(),
        viewState: ViewState.complete,
      );
      saveSearchText(text);
    }
    notifyListeners();
  }

  void getRecentSearchText() async {
    final result = await _getRecentSearchTextUseCase.execute();
    switch (result) {
      case Success<List<String>>():
        _state = state.copyWith(
          recentSearchText: result.data,
          viewState: ViewState.complete,
        );
      case Error<List<String>>():
        _state = state.copyWith(viewState: ViewState.error);
    }
    notifyListeners();
  }

  void saveSearchText(String text) async {
    final result = await _saveRecentSearchTextUseCase.execute(text);
    switch (result) {
      case Success<List<String>>():
        _state = state.copyWith(
          viewState: ViewState.complete,
          recentSearchText: result.data,
        );
      case Error<List<String>>():
        _state = state.copyWith(viewState: ViewState.error);
    }
    notifyListeners();
  }
}

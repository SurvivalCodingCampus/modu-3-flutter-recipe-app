import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  SearchState _state = const SearchState();

  List<Recipe> _previousSearchedRecipes = [];

  SearchState get state => _state;

  SearchViewModel({required RecipeRepository repository})
    : _repository = repository;

  Future<void> getRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _repository.getRecipes();
    _state = state.copyWith(recipes: recipes);
    notifyListeners();
  }

  void getSearchedRecipes(String text) async {
    final allRecipes = await _repository.getRecipes();
    if (text.isEmpty) {
      _state = state.copyWith(
        recipes: _previousSearchedRecipes,
        title: 'Recent Search',
        resultsCount: '',
      );
      notifyListeners();
      return;
    }
    final searchedData =
        allRecipes
            .where(
              (e) =>
                  e.name.toLowerCase().contains(text.toLowerCase()) ||
                  e.chef.toLowerCase().contains(text.toLowerCase()),
            )
            .toList();

    _previousSearchedRecipes = searchedData;
    _state = state.copyWith(
      recipes: searchedData,
      title: 'Search Result',
      resultsCount: '${searchedData.length} results',
    );
    notifyListeners();
  }

  void getFilteredRecipes(Filter filter) async {
    final allRecipes =
        _previousSearchedRecipes.isNotEmpty
            ? _previousSearchedRecipes // 검색 결과가 있다면 그 결과만 필터링
            : await _repository.getRecipes(); // 아니면 전체 레시피

    final filteredData =
        allRecipes
            .where((e) {
              if (filter.time == 'All') {
                return true;
              }
              return e.time == filter.time;
            })
            .where((e) => e.rating >= filter.rate)
            .where((e) {
              if (filter.category == 'All') {
                return true;
              }
              return filter.category == e.category;
            })
            .toList();

    _previousSearchedRecipes = filteredData;

    _state = state.copyWith(recipes: filteredData, filter: filter);
    notifyListeners();
  }
}

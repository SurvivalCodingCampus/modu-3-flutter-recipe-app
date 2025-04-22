import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/domain/use_case/search_recipe_use_case.dart';
import 'package:recipe_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final SearchRecipeRepository _searchRecipeRepository;
  final SearchRecipeUseCase _searchRecipeUseCase;

  SearchState _state = const SearchState();

  // final List<Recipe> _previousSearchedRecipes = [];

  SearchViewModel({
    required SearchRecipeRepository searchRecipeRepository,
    required SearchRecipeUseCase searchRecipeUseCase,
  }) : _searchRecipeRepository = searchRecipeRepository,
       _searchRecipeUseCase = searchRecipeUseCase;

  SearchState get state => _state;

  Future<void> getRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _searchRecipeRepository.getRecipes();
    _state = state.copyWith(recipes: recipes);
    notifyListeners();
  }

  Future<void> searchRecipes(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _searchRecipeUseCase.execute(query, state.filter);
    _state = state.copyWith(
      isLoading: false,
      recipes: recipes,
      title: "Search Result",
      resultsCount: "${recipes.length} results",
      query: query,
    );
    notifyListeners();
  }

  void onChangeFilter(Filter filter) async {
    _state = state.copyWith(filter: filter);
    await searchRecipes(state.query);
    notifyListeners();
  }
}

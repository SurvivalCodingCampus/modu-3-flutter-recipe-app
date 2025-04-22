import 'package:flutter/cupertino.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_recent_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/save_recent_recipes_use_case.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_main_state.dart';
import 'package:recipe_app/presentation/utils/debouncer.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final GetRecentRecipesUseCase _getRecentRecipesUseCase;
  final SaveRecentRecipesUseCase _saveRecentRecipesUseCase;
  final Debouncer _debouncer;

  SearchRecipesMainState _searchRecipesMainState =
      const SearchRecipesMainState();

  SearchRecipesMainState get searchRecipesMainState => _searchRecipesMainState;

  FilterSearchState _filterSearchState = FilterSearchState();

  FilterSearchState get filterSearchState => _filterSearchState;

  void applyFilters(FilterSearchState newFilters) async {
    _filterSearchState = newFilters;

    await fetchSearchRecipesWithFilters();
  }

  SearchRecipesViewModel({
    required GetRecentRecipesUseCase getRecentRecipesUseCase,
    required SaveRecentRecipesUseCase saveRecentRecipesUseCase,
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required Debouncer debouncer,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _getRecentRecipesUseCase = getRecentRecipesUseCase,
       _saveRecentRecipesUseCase = saveRecentRecipesUseCase,
       _debouncer = debouncer;

  Future<void> fetchSearchRecipesWithFilters() async {
    _searchRecipesMainState = searchRecipesMainState.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    notifyListeners();

    try {
      final searchedRecipes = await _getSavedRecipesUseCase.getSavedRecipes(
        query: _searchRecipesMainState.query,
        timeFilterType: _filterSearchState.selectedTimeFilterType,
        rateType: _filterSearchState.selectedRateType,
        categoryFilterType: _filterSearchState.selectedCategoryFilterType,
      );

      _searchRecipesMainState = searchRecipesMainState.copyWith(
        searchRecipes: searchedRecipes,
      );

      saveRecentRecipes(searchedRecipes);
    } catch (e) {
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        errorMessage: e.toString(),
      );
    } finally {
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        isLoading: false,
      );
      notifyListeners();
    }
  }

  Future<void> fetchSearchRecipesByQuery({required String query}) async {
    _debouncer.run(() async {
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        query: query,
        isLoading: true,
        errorMessage: null,
      );
      notifyListeners();

      if (query.isEmpty) {
        getSavedRecentRecipes();
        return;
      }

      try {
        final searchedRecipes = await _getSavedRecipesUseCase.getSavedRecipes(
          query: query,
          timeFilterType: _filterSearchState.selectedTimeFilterType,
          rateType: _filterSearchState.selectedRateType,
          categoryFilterType: _filterSearchState.selectedCategoryFilterType,
        );

        _searchRecipesMainState = searchRecipesMainState.copyWith(
          searchRecipes: searchedRecipes,
        );

        saveRecentRecipes(searchedRecipes);
      } catch (e) {
        _searchRecipesMainState = searchRecipesMainState.copyWith(
          errorMessage: e.toString(),
        );
      } finally {
        _searchRecipesMainState = searchRecipesMainState.copyWith(
          isLoading: false,
        );
        notifyListeners();
      }
    });
  }

  /// 최근 검색 recipe들을 저장 - 비동기
  Future<void> saveRecentRecipes(List<Recipe> recipes) async {
    try {
      await _saveRecentRecipesUseCase.saveRecentRecipes(recipes);
    } catch (e) {
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  /// 최근 검색 recipe들을 불러오기
  Future<void> getSavedRecentRecipes() async {
    _searchRecipesMainState = searchRecipesMainState.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    notifyListeners();

    try {
      final savedRecentRecipes = await _getRecentRecipesUseCase.getRecentRecipes();
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        searchRecipes: savedRecentRecipes,
      );
    } catch (e) {
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        errorMessage: e.toString(),
      );
    } finally {
      _searchRecipesMainState = searchRecipesMainState.copyWith(
        isLoading: false,
      );
      notifyListeners();
    }
  }


  @override
  void dispose() {
    super.dispose();
    _debouncer.dispose();
  }
}

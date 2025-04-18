import 'package:flutter/cupertino.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_main_state.dart';
import 'package:recipe_app/presentation/utils/debouncer.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final Debouncer _debouncer;

  SearchRecipesMainState _searchRecipesMainState = const SearchRecipesMainState();
  SearchRecipesMainState get searchRecipesMainState => _searchRecipesMainState;

  FilterSearchState _filterSearchState = FilterSearchState();
  FilterSearchState get filterSearchState => _filterSearchState;

  set filterSearchState(FilterSearchState value) {
    _filterSearchState = value;
    notifyListeners();
  }

  SearchRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required Debouncer debouncer,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _debouncer = debouncer;

  Future<void> fetchSearchRecipes() async {
    _searchRecipesMainState = searchRecipesMainState.copyWith(isLoading: true, errorMessage: null);
    notifyListeners();

    try {
      final savedRecipes = await _getSavedRecipesUseCase.getSavedRecipes(query: '');
      _searchRecipesMainState = searchRecipesMainState.copyWith(searchRecipes: savedRecipes);
    } catch (e) {
      _searchRecipesMainState = searchRecipesMainState.copyWith(errorMessage: e.toString());
    } finally {
      _searchRecipesMainState = searchRecipesMainState.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> fetchSearchRecipesByQuery({required String query}) async {
    _debouncer.run(() async {
      _searchRecipesMainState = searchRecipesMainState.copyWith(query: query, isLoading: true, errorMessage: null);
      notifyListeners();

      try {
        final savedRecipes = await _getSavedRecipesUseCase.getSavedRecipes(query: query);
        _searchRecipesMainState = searchRecipesMainState.copyWith(searchRecipes: savedRecipes);
      } catch (e) {
        _searchRecipesMainState = searchRecipesMainState.copyWith(errorMessage: e.toString());
      } finally {
        _searchRecipesMainState = searchRecipesMainState.copyWith(isLoading: false);
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer.dispose();
  }
}
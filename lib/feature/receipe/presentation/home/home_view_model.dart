import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_action.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;

  HomeViewModel(this._getRecipesUseCase);

  HomeState _state = const HomeState();
  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case GetRecipes():
        _getRecipes();
      case SortRecipes():
        _sortRecipes(action.text);
    }
  }

  void _sortRecipes(String text) async {
    _state = state.copyWith(
      filter: text,
      filteredRecipes:
          text == 'All'
              ? state.recipes
              : state.recipes.where((e) => e.category == text).toList(),
    );
    notifyListeners();
  }

  void _getRecipes() async {
    _state = state.copyWith(state: ViewState.loading);
    notifyListeners();
    final result = await _getRecipesUseCase.excute();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(
          state: ViewState.complete,
          recipes: result.data,
          filteredRecipes: result.data,
        );
      case Error<List<Recipe>>():
        _state = state.copyWith(state: ViewState.error);
    }
    notifyListeners();
  }
}

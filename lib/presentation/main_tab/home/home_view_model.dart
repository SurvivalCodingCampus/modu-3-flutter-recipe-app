import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/usecase/get_recipes_use_case.dart';

import 'home_action.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  HomeViewModel(this._getRecipesUseCase);

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case TapRecipe():
        final id = action.recipeId;
      // TODO: 상세 화면 이동 등 처리
      case SelectCategory():
        _state = _state.copyWith(selectedCategoryIndex: action.index);
        notifyListeners();
    }
  }

  Future<void> load() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getRecipesUseCase.execute();

    switch (result) {
      case UiSuccess(:final data):
        _state = _state.copyWith(isLoading: false, recipes: data);
      case UiError(:final message):
        _state = _state.copyWith(isLoading: false, recipes: []);
      case UiLoading():
        _state = _state.copyWith(isLoading: true, recipes: []);
      case UiEmpty():
        _state = _state.copyWith(isLoading: false, recipes: []);
    }

    notifyListeners();
  }
}

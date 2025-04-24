import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_action.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_state.dart';


class DetailRecipesViewModel with ChangeNotifier {
  DetailRecipesState _state;

  DetailRecipesViewModel({required DetailRecipesState initialState})
      : _state = initialState;

  DetailRecipesState get state => _state;

  void onAction(DetailRecipesAction action) {
    switch (action) {
      case ToggleMoreMenu():
        _state = _state.copyWith(showMoreMenu: !_state.showMoreMenu);
        notifyListeners();
        break;
      case CloseMoreMenu():
        _state = _state.copyWith(showMoreMenu: false);
        notifyListeners();
        break;
    }
  }
}
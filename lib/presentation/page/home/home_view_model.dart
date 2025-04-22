import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/page/home/home_screen_action.dart';
import 'package:recipe_app/presentation/page/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeState _state = HomeState();
  HomeState get state => _state;

  void getSearchData({required List<Recipe> searchData}) {
    _state = state.copyWith(searchData: searchData);
    print("_state : ${_state.searchData}");
    notifyListeners();
  }

  void onAction(HomeScreenAction action) {
    switch (action) {
      case OnTapSearchBar():
        getSearchData(searchData: action.searchData);
    }
  }
}

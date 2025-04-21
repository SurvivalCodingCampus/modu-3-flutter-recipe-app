import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeState _state = HomeState();
  HomeState get state => _state;

  void getSearchData({required List<Map<String, dynamic>> searchData}) {
    _state = state.copyWith(searchData: searchData);
    print("_state : ${_state.searchData}");
    notifyListeners();
  }
}

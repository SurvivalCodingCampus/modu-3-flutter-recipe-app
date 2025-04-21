import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/home/home_state.dart';

HomeState _state = HomeState();

class HomeViewModel with ChangeNotifier {
  HomeState get state => _state;

  void getSearchData({required List<Map<String, dynamic>> searchData}) {
    _state = state.copyWith(searchData: searchData);
    print("_state : ${_state.searchData}");
    notifyListeners();
  }
}

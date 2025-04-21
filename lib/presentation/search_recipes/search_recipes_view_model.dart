import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_event.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../component/filter_search_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  final _eventController = StreamController<SearchRecipesEvent>();

  Stream<SearchRecipesEvent> get eventStream => _eventController.stream;

  void setValue(FilterSearchState newValue) {
    _state = state.copyWith(filterSearchState: newValue);
    notifyListeners();
  }

  void onNetworkError() {
    _eventController.add(SearchRecipesEvent.showDialog('네트워크 에러 발생'));
  }

  void onError2() {
    _eventController.add(SearchRecipesEvent.networkError('네트워크 에러'));
  }

  void onError3() {
    _eventController.add(SearchRecipesEvent.timeoutError('message'));
  }

  void onError4() {
    _eventController.add(SearchRecipesEvent.showSnackbar('message'));
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen_event.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  SearchRecipesState _state = const SearchRecipesState();

  RecipeRepository get recipeRepository => _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository);

  SearchRecipesState get state => _state;

  final _eventController = StreamController<SearchRecipesScreenEvent>();

  Stream<SearchRecipesScreenEvent> get eventStream => _eventController.stream;

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }

  //view에서 모든 레시피 가져오는 메서드, 따로 usecase처리 필요 없음
  Future<void> fetchRecipes() async {
    _state = state.copyWith(isRecipesLoading: true);
    notifyListeners();
    _state = _state.copyWith(
      recipes: await recipeRepository.fetchRecipes(),
      isRecipesLoading: false,
    );

    notifyListeners();
  }

  //view에서 검색어가 포함된 레시피 가져오는 메서드
  Future<void> searchRecipes(String keyword) async {
    _state = _state.copyWith(isRecipesLoading: true);
    notifyListeners();
    _state = _state.copyWith(
      recipes: await recipeRepository.searchRecipes(keyword),
      isRecipesLoading: false,
    );
    notifyListeners();
  }
}

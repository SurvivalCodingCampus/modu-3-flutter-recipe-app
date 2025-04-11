import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/repository/recipe_repository.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepo;

  HomeViewModel(this._recipeRepo);

  List<Recipe> _recipes = [];
  // 외부에서 리스트 변경이 안되도록 설정
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  // 초기 상태를 loading으로 설정
  BaseState _state = BaseState.loading;
  BaseState get state => _state;

  void fetchRecipes() async {
    _state = BaseState.loading;
    notifyListeners();
    final resp = await _recipeRepo.getRecipes();
    switch (resp) {
      case Success<List<Recipe>>():
        _recipes = resp.data;
        _state = BaseState.complete;
        break;
      case Error<List<Recipe>>():
        _state = BaseState.error;
        break;
    }
  }
}

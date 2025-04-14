import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  List<Recipe> _savedRecipes = []; // 조작 불가능 캡슐화
  List<Recipe> get savedRecipes =>
      List.unmodifiable(_savedRecipes); // List 조작 불가능

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSavedRecipe() async {
    // 로딩 시작 알림
    _isLoading = true;
    notifyListeners();
    // 데이터 가지고 오고 로딩 꺼짐 알림
    _savedRecipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }
}

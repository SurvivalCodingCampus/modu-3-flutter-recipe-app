import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/data/repository/recipe_data_source.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  SavedRecipesViewModel(this._repository) {
    _loadRecipes(); // 생성자에서 자동 데이터 로드
  }

  Future<void> _loadRecipes() async {
    final data = await _repository.getRecipes();
    _recipes = data;
    notifyListeners(); // 상태 변경 알림
  }
}
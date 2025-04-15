import 'package:flutter/material.dart';
import 'package:recipe_app/data_source/recipes/recipe_data_source_impl.dart';
import 'package:recipe_app/model/recipe/recipe.dart';
import 'package:recipe_app/repository/recipes/recipe_repository.dart';
import 'package:recipe_app/repository/recipes/recipe_repository_impl.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository = RecipeRepositoryImpl(
    dataSource: RecipeDataSourceImpl(),
  );

  bool _isLoading = false;

  List<Recipe> recipeList = [];

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  void fetchData() async {
    _isLoading = true;
    recipeList = await _recipeRepository.getSaveRecipeList();
    if (recipeList.isNotEmpty) {
      print("데이터 로딩 완료");
      _isLoading = false;
    }
    notifyListeners();
  }
}

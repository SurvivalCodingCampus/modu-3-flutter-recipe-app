import 'package:flutter/material.dart';

import '../../../data/data_source/recipe/recipe_data_source_impl.dart';
import '../../../data/repository/recipe_repository/recipe_repository.dart';
import '../../../data/repository/recipe_repository/recipe_repository_impl.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  HomeViewModel()
    : _recipeRepository = RecipeRepositoryImpl(RecipeDataSourceImpl());

  HomeState _state = const HomeState();

  HomeState get state => _state;

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final recipes = await _recipeRepository.getRecipes();
  }

  void updateCategory(String selectedCategory) {
    _state = _state.copyWith(keyword: selectedCategory);
    notifyListeners();
  }
}

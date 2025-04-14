import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  // 상태
  HomeState _state = const HomeState();

  HomeState get state => _state;

  HomeViewModel(this._recipeRepository);

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }
}

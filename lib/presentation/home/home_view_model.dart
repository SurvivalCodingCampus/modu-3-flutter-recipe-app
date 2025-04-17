import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/data/repository/user_repository.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final UserRepository _userRepository;

  HomeState _state = const HomeState();

  HomeState get state => _state;

  // 상태
  HomeViewModel(this._recipeRepository, this._userRepository);

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final user = await _userRepository.getUser();

    _state = state.copyWith(
      user: user,
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }
}

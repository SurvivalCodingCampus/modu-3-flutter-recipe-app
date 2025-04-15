import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel extends ValueNotifier<HomeState> {
  final RecipeRepository _recipeRepository;

  HomeState get state => value;

  // 상태
  HomeViewModel(this._recipeRepository) : super(HomeState());

  Future<void> fetchRecipes() async {
    value = value.copyWith(isLoading: true);

    value = value.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
  }
}

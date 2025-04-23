import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_state.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  final BookmarkRepository _bookmarkRepository;
  HomeState _state = const HomeState();

  HomeViewModel(this._repository, this._bookmarkRepository);

  HomeState get state => _state;

  Future<void> action(HomeAction action) async {
    switch (action) {
      case OnCategoryClick():
        _findRecipesByCategory(action.category);
      case FindRecipes():
        _findRecipes();
      case OnBookmarkClick():
        _bookmarkRepository.save(action.recipeId);
      case OnSearchTap():
        break;
    }

    notifyListeners();
  }

  Future<void> _findRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.findDatas();

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(isLoading: false, recipes: result.success);
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Future<void> _findRecipesByCategory(String category) async {
    _state = state.copyWith(isLoading: true);
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    final result = await _repository.findRecipeByCategory(category);

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(isLoading: false, recipes: result.success);
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}

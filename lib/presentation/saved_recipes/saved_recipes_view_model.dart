import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

import '../../data/model/recipe.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  bool _isLoading = false;
  List<Recipe> _recipes = [];

  // ======================== 임시 나중에 처리할 것 ===============================
  final User _user = User(
      id: 1,
      name: 'Human',
      image: '',
      address: '',
      bookmarks: {}
  );
  // ======================== 임시 나중에 처리할 것 ===============================

  User get user => _user;
  bool get isLoading => _isLoading;
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    _isLoading = true;
  }

  void fetchRecipes() async {
    _recipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }

  void toggleBookmark(int id) {
    if (user.bookmarks.contains(id)) {
      deleteBookmarkToUserModel(id);
    } else {
      saveBookmarkToUserModel(id);
    }
  }

  void saveBookmarkToUserModel(int id) {
    _user.bookmarks.add(id);
    notifyListeners();
  }

  void deleteBookmarkToUserModel(int id) {
    _user.bookmarks.remove(id);
    notifyListeners();
  }
}

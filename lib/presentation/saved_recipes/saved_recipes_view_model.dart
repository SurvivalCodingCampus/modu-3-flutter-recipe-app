import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

import '../../data/model/recipe.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  // 상태
  SavedRecipesState _state = const SavedRecipesState();
  SavedRecipesState get state => _state;

  // ======================== 임시 나중에 처리할 것 ===============================
  final User _user = User(
      id: 1,
      name: 'Human',
      image: '',
      address: '',
      bookmarks: {}
  );

  User get user => _user;
  // ======================== 임시 나중에 처리할 것 ===============================


  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    _state = state.copyWith(isLoading: true);
  }

  void fetchRecipes() async {
    _state = state.copyWith(recipes: await _recipeRepository.getRecipes());
    _state = state.copyWith(isLoading: false);
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

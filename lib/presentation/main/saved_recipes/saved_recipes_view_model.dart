import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_bookmark_use_case.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final ToggleBookmarkUseCase _toggleBookmarkUseCase;

  // 상태
  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  // // ======================== 임시 나중에 처리할 것 ===============================
  // final User _user = User(
  //   id: 1,
  //   name: 'Human',
  //   image: '',
  //   address: '',
  //   bookmarks: [],
  // );
  //
  // User get user => _user;
  //
  // // ======================== 임시 나중에 처리할 것 ===============================

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required ToggleBookmarkUseCase toggleBookmarkUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _toggleBookmarkUseCase = toggleBookmarkUseCase {
    _state = state.copyWith(isLoading: true);
    fetchSavedRecipes();
  }

  void fetchSavedRecipes() async {
    _state = state.copyWith(recipes: await _getSavedRecipesUseCase.execute());
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void toggleBookmark(int id) async {
    _state = state.copyWith(isLoading: true);
    await _toggleBookmarkUseCase.execute(id);
    fetchSavedRecipes();
  }
}

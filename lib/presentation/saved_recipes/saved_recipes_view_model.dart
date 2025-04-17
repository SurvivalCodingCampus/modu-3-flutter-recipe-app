import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/saved_recipe/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _case;
  final RecipeRepository _recipeRepository;
  final Set<int> _bookmarkedRecipes = {};
  Set<int> get bookmarkedRecipes => _bookmarkedRecipes;

  SavedRecipesState _state = SavedRecipesState();
  SavedRecipesState get state => _state;

  SavedRecipesViewModel(this._case, this._recipeRepository) {
    loadRecipes(1);
  }

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> fetchSavedRecipes(int userId) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final savedRecipes = await _case.excute(userId);

      _state = state.copyWith(recipes: savedRecipes, isLoading: false);
    } catch (e) {
      _state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    notifyListeners();
  }

  Future<void> loadRecipes(int userId) async {
    if (_bookmarkedRecipes.isEmpty) {
      await fetchRecipes();
    } else {
      await fetchSavedRecipes(userId);
    }
  }

  void addBookmark(int recipeId) {
    if (_bookmarkedRecipes.contains(recipeId)) return;

    _bookmarkedRecipes.add(recipeId);
    notifyListeners();
  }

  void removeBookmark(int recipeId) {
    if (!_bookmarkedRecipes.contains(recipeId)) return;

    _bookmarkedRecipes.remove(recipeId);
    notifyListeners();
  }
}

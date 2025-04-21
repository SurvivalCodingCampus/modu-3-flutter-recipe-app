import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/saved_recipe/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RecipeRepository _recipeRepository;

  SavedRecipesState _state = SavedRecipesState();
  SavedRecipesState get state => _state;

  SavedRecipesViewModel(this._getSavedRecipesUseCase, this._recipeRepository);

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
      final savedRecipes = await _getSavedRecipesUseCase.excute(userId);

      _state = state.copyWith(
        recipes: savedRecipes,
        isLoading: false,
        bookmarkedRecipes: savedRecipes.map((e) => e.id).toSet(),
      );
    } catch (e) {
      _state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    notifyListeners();
  }

  void toggleBookmark(int recipeId) {
    final updatedBookmarks = Set<int>.from(_state.bookmarkedRecipes);

    if (updatedBookmarks.contains(recipeId)) {
      updatedBookmarks.remove(recipeId);
      notifyListeners();
    } else {
      updatedBookmarks.add(recipeId);
      notifyListeners();
    }

    _state = state.copyWith(
      bookmarkedRecipes: updatedBookmarks,
      recipes:
          _state.recipes
              .where((element) => updatedBookmarks.contains(element.id))
              .toList(),
    );

    notifyListeners();
  }
}

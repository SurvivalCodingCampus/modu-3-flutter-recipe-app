import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/domain/use_case/add_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/remove_bookmark_use_case.dart';

import '../../data/model/recipe.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveBookmarkUseCase _removeBookmarkUseCase;
  final AddBookmarkUseCase _addBookmarkUseCase;

  SavedRecipesViewModel(
    this._recipeRepository,
    this._getSavedRecipesUseCase,
    this._removeBookmarkUseCase,
    this._addBookmarkUseCase,
  );

  List<Recipe> get recipes => _recipes;
  List<Recipe> _recipes = [];

  //List내용 임의로 변형시키지 못함
  //List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadRecipesData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.fetchRecipes();
    _isLoading = false;
    notifyListeners();
  }

  //savedrecipes 출력
  Future<List<Recipe>> getSavedRecipesUseCase() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.execute();
    _isLoading = false;
    notifyListeners();
    return _recipes.toList();
  }

  void removeBookmarkUseCase(int id) {
    _removeBookmarkUseCase.execute(id);
    notifyListeners();
  }

  void addBookmarkUseCase(Recipe recipe) {
    _addBookmarkUseCase.execute(recipe);
    _recipes.add(recipe.copyWith(bookMarked: true));
  }
}

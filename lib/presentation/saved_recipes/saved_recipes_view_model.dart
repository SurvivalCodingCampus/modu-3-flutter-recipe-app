import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    fetchRecipes();
  }

  // List<Recipe> _recipes = [];
  // List<Recipe> get recipes => List.unmodifiable(_recipes);

  // List<int> _bookMarkList = [];
  // List<int> get bookMarkList => List.unmodifiable(_bookMarkList);

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  SavedRecipesState _state = const SavedRecipesState();
  SavedRecipesState get state => _state;

  void onAction(SavedRecipesAction action) {
    switch (action) {
      case OnTapRecipe():
        break;
      case OnTapBookmark():
        throw UnimplementedError();
    }
  }

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _getSavedRecipesUseCase.getSavedRecipes();
    final bookMarkList = List.generate(
      recipes.length,
      (index) => recipes[index].recipeId,
    );
    _state = _state.copyWith(
      recipes: recipes,
      bookMarkList: bookMarkList,
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> bookmarkRecipe(int recipeId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    // print("세이브 레시피 뷰모델.bookmarkRecipe 실행 recipeId : $recipeId");
    final bookmarkList = await _getSavedRecipesUseCase.setBookmark(4, recipeId);
    // print("북마크리스트 갱신 완료");
    final recipes = await _getSavedRecipesUseCase.getSavedRecipes();
    // print("북마크 후 수정된 recipes : ${_recipes.map((e) => "${e.recipeId} :")}");

    _state = _state.copyWith(
      recipes: recipes,
      bookMarkList: bookmarkList,
      isLoading: false,
    );
    notifyListeners();
  }

  Future<int> getUserId() async {
    final userId = await _getSavedRecipesUseCase.getUserId();
    return userId;
  }

  Future<List<int>> getSavedRecipeIds() async {
    final recipes = await _getSavedRecipesUseCase.getSavedRecipes();
    return List.generate(recipes.length, (index) => recipes[index].recipeId);
  }
}

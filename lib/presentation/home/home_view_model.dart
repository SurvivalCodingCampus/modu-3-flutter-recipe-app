import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/get_user_model_use_case.dart';
import 'package:recipe_app/domain/use_case/set_bookmark_use_case.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetUserModelUseCase _getUserModelUseCase;
  final SetBookmarkUseCase _setBookmarkUseCase;
  final RecipeRepository _recipeRepository;

  HomeViewModel({
    required GetUserModelUseCase getUserModelUseCase,
    required RecipeRepository recipeRepository,
    required SetBookmarkUseCase setBookmarkUseCase,
  }) : _getUserModelUseCase = getUserModelUseCase,
       _recipeRepository = recipeRepository,
       _setBookmarkUseCase = setBookmarkUseCase;

  HomeState _state = const HomeState();
  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case OnSearchTap():
        break;
      case OnSelectTap():
        _state = _state.copyWith(selectedIndex: action.index);
        notifyListeners();
        break;
      case OnRecipeTap():
        break;
      case OnBookmarkTap():
        bookmarkRecipe(action.recipeId);
    }
  }

  Future<void> bookmarkRecipe(int recipeId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final bookmarkList = await _setBookmarkUseCase.execute(4, recipeId);
    _state = _state.copyWith(bookmarkList: bookmarkList, isLoading: false);
    notifyListeners();
  }

  void loadRecipeAndUser() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _recipeRepository.getRecipes();
    final userModel = await _getUserModelUseCase.execute(4);
    _state = _state.copyWith(
      allRecipes: recipes,
      isLoading: false,
      userModel: userModel,
      bookmarkList: userModel.bookMarkList,
    );
    notifyListeners();
  }
}

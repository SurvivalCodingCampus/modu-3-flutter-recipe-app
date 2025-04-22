import 'package:flutter/material.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/toggle_bookmark_use_case.dart';
import 'package:recipe_app/presentation/main/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final UserRepository _userRepository;
  final ToggleBookmarkUseCase _toggleBookmarkUseCase;

  HomeState _state = const HomeState();
  HomeState get state => _state;

  HomeViewModel({
    required RecipeRepository recipeRepository,
    required UserRepository userRepository,
    required ToggleBookmarkUseCase toggleBookmarkUseCase,
  }) : _recipeRepository = recipeRepository,
       _userRepository = userRepository,
       _toggleBookmarkUseCase = toggleBookmarkUseCase {
    fetchRecipes();
  }

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    final recipes = await _recipeRepository.getRecipes();
    final user = await _userRepository.getUser();

    // 유저 북마크 정보 불러오기
    _state = state.copyWith(userBookmarks: user.bookmarks);

    //초기 순수한 레시피 저장
    _state = state.copyWith(recipes: recipes);

    // 유저 북마크 정보 적용한 레시피 저장
    _state = state.copyWith(filteredRecipes: recipes);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void toggleBookmark(int id) async {
    _state = state.copyWith(isLoading: true);
    await _toggleBookmarkUseCase.execute(id);

    final user = await _userRepository.getUser();
    _state = state.copyWith(userBookmarks: user.bookmarks);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void setCategoryFilter(CategoryFilter categoryFilter) {
    if(categoryFilter == CategoryFilter.All) {
      _state = state.copyWith(filteredRecipes: state.recipes);
    } else {
      final filteredRecipes = state.recipes.where((e) => e.category == categoryFilter).toList();
      _state = state.copyWith(filteredRecipes: filteredRecipes);
    }
    notifyListeners();
  }
}
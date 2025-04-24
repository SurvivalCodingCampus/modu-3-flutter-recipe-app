import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/book_mark/book_mark.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/use_case/book_mark/add_book_mark_use_case.dart';
import 'package:recipe_app/domain/use_case/book_mark/remove_book_mark_use_case.dart';
import 'package:recipe_app/domain/use_case/recipe/fetch_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/book_mark/get_book_marked_recipes_id_use_case.dart';

import 'package:recipe_app/domain/use_case/user/get_login_user_info_use_case.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/state/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final FetchRecipesUseCase _fetchRecipesUseCase;
  final AddBookMarkUseCase _addBookMarkUseCase;
  final RemoveBookMarkUseCase _removeBookMarkUseCase;
  final GetBookMarkedRecipesIdUseCase _getBookMarkedRecipesIdUseCase;
  final GetLoginUserInfoUseCase _getLoginUserInfo;
  HomeViewModel({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required GetBookMarkedRecipesIdUseCase getBookMarkedRecipesIdUseCase,
    required RemoveBookMarkUseCase removeBookMarkUseCase,
    required AddBookMarkUseCase addBookMarkUseCase,
    required GetLoginUserInfoUseCase getLoginUserInfo,
  }) : _fetchRecipesUseCase = fetchRecipesUseCase,
       _getBookMarkedRecipesIdUseCase = getBookMarkedRecipesIdUseCase,
       _removeBookMarkUseCase = removeBookMarkUseCase,
       _addBookMarkUseCase = addBookMarkUseCase,
       _getLoginUserInfo = getLoginUserInfo;

  HomeState _state = HomeState();
  HomeState get state => _state;

  Future<void> getUserData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    // 데이터 로드
    final user = await _getLoginUserInfo.execute();
    final allRecipes = await _fetchRecipesUseCase.execute(); // 전체 레시피 목록
    final bookmarkedIds = await _getBookMarkedRecipesIdUseCase.execute(
      user.id,
    ); // 북마크된 레시피 ID 목록

    // 레시피의 ID와 bookmarkedIds를 매칭하여 isBookmarked 업데이트
    final updatedRecipes =
        allRecipes.map((recipe) {
          final isBookmarked = bookmarkedIds.contains(
            recipe.recipeId,
          ); // 북마크 여부 체크
          return recipe.copyWith(
            isBookmarked: isBookmarked,
          ); // isBookmarked 속성 업데이트
        }).toList(); // 리스트로 변환

    if (state.category == Category.all) {
      _state = state.copyWith(
        user: user,
        recipes: updatedRecipes,
        selectRecipes: updatedRecipes, // 모든 카테고리 포함
      );
    } else {
      // 선택된 카테고리 필터링
      final selectRecipes =
          updatedRecipes
              .where((recipe) => recipe.category == state.category)
              .toList();

      _state = state.copyWith(
        user: user,
        recipes: updatedRecipes,
        selectRecipes: selectRecipes, // 선택된 카테고리에만 포함
      );
    }

    notifyListeners(); // UI 갱신
  }

  void updateSelectedCategory(Category category) {
    final selectRecipe =
        state.recipes
            .where((recipe) => recipe.category == state.category)
            .toList();
    if (category == Category.all) {
      _state = state.copyWith(category: category, selectRecipes: state.recipes);
    } else {
      _state = state.copyWith(category: category, selectRecipes: selectRecipe);
    }

    notifyListeners();
  }

  Future<void> onClickBookMark(int recipeId) async {
    // 현재 북마크 상태 탐색
    final isBookmarked =
        state.selectRecipes
            .firstWhere((recipe) => recipe.recipeId == recipeId)
            .isBookmarked;

    if (isBookmarked) {
      await _removeBookMarkUseCase.execute(recipeId);
    } else {
      await _addBookMarkUseCase.execute(recipeId);
    }

    // UI 업데이트를 위해 상태를 갱신한다
    final updatedRecipes =
        state.selectRecipes.map((recipe) {
          if (recipe.recipeId == recipeId) {
            return recipe.copyWith(isBookmarked: !recipe.isBookmarked);
          }
          return recipe;
        }).toList();

    // 상태 갱신
    _state = state.copyWith(selectRecipes: updatedRecipes);
    notifyListeners(); // UI 갱신
  }
}

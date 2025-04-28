import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/use_case/book_mark/get_book_marked_recipes_id_use_case.dart';
import 'package:recipe_app/domain/use_case/book_mark/remove_book_mark_use_case.dart';
import 'package:recipe_app/domain/use_case/book_mark/stream_book_mark_use_case.dart';
import 'package:recipe_app/domain/use_case/user/get_login_user_info_use_case.dart';
import 'package:recipe_app/domain/use_case/recipe/get_recipes_by_ids_use_case.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/state/saved_recipe_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetLoginUserInfoUseCase _getLoginUserInfo; // 로그인 회원
  final GetBookMarkedRecipesIdUseCase
  _getBookMarkedRecipesIdUseCase; // 북마크 아이디목록 가져오기
  final RemoveBookMarkUseCase _removeBookMarkUseCase;
  final GetRecipesByIdsUseCase _getRecipesByIdsUseCase; // 북마크된 레시피 가져오기
  final StreamBookMarkUseCase _streamBookMarkUseCase;

  SavedRecipesViewModel({
    required GetLoginUserInfoUseCase getLoginUserInfo,
    required GetBookMarkedRecipesIdUseCase getBookMarkedRecipesIdUseCase,
    required RemoveBookMarkUseCase removeBookMarkUseCase,
    required GetRecipesByIdsUseCase getRecipesByIdsUseCase,
    required StreamBookMarkUseCase streamBookMarkUseCase,
  }) : _getLoginUserInfo = getLoginUserInfo,
       _getBookMarkedRecipesIdUseCase = getBookMarkedRecipesIdUseCase,
       _removeBookMarkUseCase = removeBookMarkUseCase,
       _streamBookMarkUseCase = streamBookMarkUseCase,
       _getRecipesByIdsUseCase = getRecipesByIdsUseCase;

  SavedRecipeState _state = SavedRecipeState();
  SavedRecipeState get state => _state;

  StreamSubscription? _subscription;

  Future<void> fetchSavedRecipe() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    // 로그인된 회원
    final user = await _getLoginUserInfo.execute();

    // 북마크 RecipeId 목록
    _subscription = _streamBookMarkUseCase.execute(user.id).listen((
      bookMarks,
    ) async {
      if (bookMarks.bookMarkedRecipesId.isEmpty) {
        _state = state.copyWith(
          isLoading: false,
          errorMessage: '저장된 레시피가 없습니다.',
          savedRecipes: [],
        );
        notifyListeners();
        return;
      }

      // Recipe 내용 조회
      final recipes = await _getRecipesByIdsUseCase.execute(
        bookMarks.bookMarkedRecipesId,
      );

      _state = state.copyWith(
        isLoading: false,
        user: user,
        savedRecipes: recipes,
      );
      notifyListeners();
    });
  }

  // 레시피 카드 클릭시 상태 변경하기
  void setRecipeCardState(Recipe recipe) {
    _state = state.copyWith(
      recipeCardState: state.recipeCardState.copyWith(
        isGrid: state.recipeCardState.isGrid,
        recipe: recipe,
        isSaved: state.savedRecipes.any(
          (recipeId) => recipeId.recipeId == recipe.recipeId,
        ),
      ),
    );
  }

  // 레시피 카드 클릭시 북마크 지우기
  void removeToggle(int targetRecipeId) async {
    await _removeBookMarkUseCase.execute(targetRecipeId);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

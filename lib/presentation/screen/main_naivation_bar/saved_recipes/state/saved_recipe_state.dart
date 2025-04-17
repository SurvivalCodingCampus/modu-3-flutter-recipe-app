// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_app/domain/model/book_mark/book_mark.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/state/recipe_card_state.dart';

part 'saved_recipe_state.freezed.dart';

@freezed
class SavedRecipeState with _$SavedRecipeState {
  final List<Recipe> recipes; // 불러온 리스트 목록
  final List<Recipe> savedRecipes; // 저장된 리스트 목록
  final bool isLoading;
  final User? user;
  final BookMark? bookMarkList;
  final String errorMessage;
  final RecipeCardState recipeCardState;

  SavedRecipeState({
    this.savedRecipes = const [],
    this.recipes = const [],
    this.isLoading = false,
    this.user,
    this.bookMarkList,
    this.errorMessage = '',
    this.recipeCardState = const RecipeCardState(),
  });
}

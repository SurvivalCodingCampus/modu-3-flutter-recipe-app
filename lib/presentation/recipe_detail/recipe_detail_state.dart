import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'recipe_detail_state.freezed.dart';

@freezed
class RecipeDetailState with _$RecipeDetailState {
  const RecipeDetailState({
    this.recipe = const UiState.empty(),
    this.selectedTabIndex = 0,
  });
  final UiState<Recipe> recipe;
  final int selectedTabIndex;
}

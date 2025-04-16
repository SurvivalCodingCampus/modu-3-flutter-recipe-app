import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  const SavedRecipesState({
    this.recipes = const UiState.empty(),
    this.errorMessage,
  });

  final UiState<List<Recipe>> recipes;
  final String? errorMessage;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'ingredient_state.freezed.dart';

@freezed
class IngredientState with _$IngredientState {
  const IngredientState({this.recipe = const UiState.empty()});
  final UiState<Recipe> recipe;
}

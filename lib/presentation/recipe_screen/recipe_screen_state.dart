import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/procedure_model.dart';
import '../../data/model/recipe_ingredient.dart';
import '../../data/model/recipe_model.dart';

part 'recipe_screen_state.freezed.dart';

@freezed
class RecipeScreenState with _$RecipeScreenState {
  final bool isLoading;
  final Recipe? recipe;
  final List<Procedure> procedures;
  final List<RecipeIngredient> ingredients;
  final bool isIngredientSelected;
  final String? error;

  const RecipeScreenState({
    this.isLoading = true,
    this.recipe,
    this.procedures = const [],
    this.ingredients = const [],
    this.isIngredientSelected = true,
    this.error,
  });
}

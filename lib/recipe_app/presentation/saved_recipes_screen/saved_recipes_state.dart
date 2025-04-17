import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  final List<Recipe> recipes;
  final bool isRecipesLoading;

  const SavedRecipesState({
    this.recipes = const [],
    this.isRecipesLoading = false,
  });
}

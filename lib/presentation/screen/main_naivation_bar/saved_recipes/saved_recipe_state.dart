// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';

part 'saved_recipe_state.freezed.dart';

@freezed
class SavedRecipeState with _$SavedRecipeState {
  final List<Recipe> savedRecipes;
  final bool isLoading;

  SavedRecipeState({this.savedRecipes = const [], this.isLoading = false});
}

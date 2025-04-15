import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SavedRecipesState with _$SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;

  SavedRecipesState({this.recipes = const [], this.isLoading = false});
}

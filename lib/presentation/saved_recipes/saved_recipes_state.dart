import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SavedRecipesState with _$SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;
  final bool isBookmarked;
  final String errorMessage;
  final Set<int> bookmarkedRecipes;

  SavedRecipesState({
    this.recipes = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.bookmarkedRecipes = const {},
    this.isBookmarked = false,
  });
}

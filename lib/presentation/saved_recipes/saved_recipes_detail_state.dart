import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'saved_recipes_detail_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SavedRecipesDetailState with _$SavedRecipesDetailState {
  final List<Recipe> recipes;
  final bool isLoading;
  final bool isBookmarked;
  final String errorMessage;
  final Set<int> bookmarkedRecipes;

  SavedRecipesDetailState({
    this.recipes = const [],
    this.isLoading = false,
    this.errorMessage = '',
    this.bookmarkedRecipes = const {},
    this.isBookmarked = false,
  });
}

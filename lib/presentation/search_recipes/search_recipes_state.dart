import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe.dart';

part 'search_recipes_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;
  final String text;

  SearchRecipesState({
    this.recipes = const [],
    this.isLoading = false,
    this.text = '',
  });
}

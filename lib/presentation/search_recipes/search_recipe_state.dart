import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipes.dart';

part 'search_recipe_state.freezed.dart';

part 'search_recipe_state.g.dart';

@freezed
abstract class SearchRecipeState with _$SearchRecipeState {
  const factory SearchRecipeState({
    required List<Recipes> recipes,
    required List<Recipes> filterRecipes,
    required String keyword,
    required bool isLoading,
  }) = _SearchRecipeState;

  factory SearchRecipeState.fromJson(Map<String, Object?> json) =>
      _$SearchRecipeStateFromJson(json);
}

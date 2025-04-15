import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/search_recipes/filter_state.dart';

import '../../utils/errors/recipe_error_enum.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(0) int count,
    @Default(null) RecipeErrorEnum? error,
    @Default(false) bool isLoading,
    @Default(FilterState()) FilterState filtetState,
  }) = _SearchRecipesState;
}

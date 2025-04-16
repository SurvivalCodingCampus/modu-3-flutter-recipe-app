// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
// Project imports:
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  const SearchRecipesState({
    this.recipes = const UiState.empty(),
    this.filtered = const [],
    this.query = '',
    this.filterSearchState = const FilterSearchState(),
  });

  final UiState<List<Recipe>> recipes;
  final List<Recipe> filtered;
  final String query;
  final FilterSearchState filterSearchState;
}

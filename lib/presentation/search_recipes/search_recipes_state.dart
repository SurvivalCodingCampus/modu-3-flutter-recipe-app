import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/util/ui_state.dart';

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

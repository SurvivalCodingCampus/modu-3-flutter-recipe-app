import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/presentation/component/filter_search_state.dart';

part 'search_recipes_state.freezed.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  final FilterSearchState filterSearchState;
  final bool isLoading;

  const SearchRecipesState({
    this.filterSearchState = const FilterSearchState(
      value: 0,
      switchValue: false,
    ),
    this.isLoading = false,
  });
}

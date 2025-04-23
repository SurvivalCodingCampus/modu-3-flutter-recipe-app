import 'package:freezed_annotation/freezed_annotation.dart';

import '../../component/filter_search_sheet/filter_search_state.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.onSearch(String value) = OnSearch;
  const factory SearchRecipesAction.onSetFilter(FilterSearchState filterSearchState) = OnSetFilter;
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.onSubmitSearch(String query) =
      OnSubmitSearch;
  const factory SearchRecipesAction.onApplyFilter(
    FilterSearchBottomSheetState state,
  ) = OnApplyFilter;
  const factory SearchRecipesAction.onTapBackArrow() = OnTapBackArrow;
}

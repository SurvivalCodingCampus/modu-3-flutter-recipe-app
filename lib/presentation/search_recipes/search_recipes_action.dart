import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.onQueryChange(String query) = OnQueryChange;
  const factory SearchRecipesAction.onTapRecipe(Recipe recipe) = OnTapRecipe;
  const factory SearchRecipesAction.onApplyFilter(FilterSearchState filter) =
      OnApplyFilter;
  const factory SearchRecipesAction.onClearFilter() = OnClearFilter;
  const factory SearchRecipesAction.onOpenFilterSheet() = OnOpenFilterSheet;
  const factory SearchRecipesAction.onRetry() = OnRetry;
}

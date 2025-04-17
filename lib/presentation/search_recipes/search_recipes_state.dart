import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('') String query,
    @Default(FilterSearchBottomSheetState())
    FilterSearchBottomSheetState bottomSheetFilter,
  }) = _SearchRecipesState;
}

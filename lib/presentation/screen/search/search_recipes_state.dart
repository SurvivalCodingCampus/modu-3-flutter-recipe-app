import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';

part 'search_recipes_state.freezed.dart';
part 'search_recipes_state.g.dart';

@freezed
class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> allRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
    @Default({}) Map<String, dynamic> appliedFilters, // ← 이 줄 추가 필요
  }) = _SearchRecipesState;
  factory SearchRecipesState.fromJson(Map<String, dynamic> json) =>
      _$SearchRecipesStateFromJson(json); // ← 이 줄 있어야 g.dart 생성됨
}

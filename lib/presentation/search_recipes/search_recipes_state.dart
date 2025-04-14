import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe.dart';

part 'search_recipes_state.freezed.dart';
part 'search_recipes_state.g.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState{
  const factory SearchRecipesState({
    @Default([]) final List<Recipe> recipeList,
    @Default('') final String searchText,
    @Default(false) final bool isLoading,
    @Default(false) final bool isSearched,
  }) = _SearchRecipesState;

  factory SearchRecipesState.fromJson(Map<String, dynamic> json) => _$SearchRecipesStateFromJson(json);
}
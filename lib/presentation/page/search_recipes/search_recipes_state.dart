import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'search_recipes_state.freezed.dart';


@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default([]) List<Recipe> filterRecipes,
    @Default([]) List<Recipe> beforeSearchRecipes,
    @Default('') String searchKeyWord,
    @Default(false) bool searchState,
    @Default(false) bool isSearchLoading,
  }) = _SearchRecipesState;
}
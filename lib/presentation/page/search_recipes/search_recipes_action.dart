import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction {
  const factory SearchRecipesAction.onPageLoadGetData() = onPageLoadGetData;
  const factory SearchRecipesAction.onSearchRecipe(String keyWord) = onSearchRecipe;
  const factory SearchRecipesAction.onFilterSearchRecipes(Map<String,dynamic> searchData) = onFilterSearchRecipes;
}

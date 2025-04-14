import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe.dart';

part 'search_recipes_state.freezed.dart';

@freezed
abstract class SearchRecipesState with _$SearchRecipesState {
  const factory SearchRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('') String query,
  }) = _SearchRecipesState;
}

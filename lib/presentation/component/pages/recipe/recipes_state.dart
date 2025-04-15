import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/recipe_model.dart';

part 'recipes_state.freezed.dart';
part 'recipes_state.g.dart';

@freezed
class RecipesState with _$RecipesState {
  const factory RecipesState({
    @Default([]) List<Recipe> allRecipes,
    @Default([]) List<Recipe> filteredRecipes,
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
  }) = _RecipesState;

  factory RecipesState.fromJson(Map<String, dynamic> json) =>
      _$RecipesStateFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/presentation/screen/recipe/recipes_ui_model.dart';

part 'recipes_state.freezed.dart';

@freezed
class RecipesState with _$RecipesState {
  const factory RecipesState({
    @Default([]) List<RecipeUiModel> allRecipes,
    @Default([]) List<RecipeUiModel> filteredRecipes,
    @Default(false) bool isLoading,
    @Default('') String searchQuery,
  }) = _RecipesState;
}

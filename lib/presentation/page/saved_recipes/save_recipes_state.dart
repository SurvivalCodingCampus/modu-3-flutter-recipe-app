import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
part 'save_recipes_state.freezed.dart';



@freezed
class SaveRecipesState with _$SaveRecipesState {
  final bool isLoading;
  final List<Recipe> recipeList;

  const SaveRecipesState({
     this.isLoading = false,
     this.recipeList = const [],
  });
}

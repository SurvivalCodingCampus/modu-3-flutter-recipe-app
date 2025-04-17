import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';
import '../../data/model/recipe_model.dart';

class ToggleBookMarkUseCase {
  final RecipeRepository _recipeRepository;

  ToggleBookMarkUseCase(this._recipeRepository);

  Future<void> toggleBookmark(Recipe recipe) async {
    await _recipeRepository.toggleBookMarkRecipe(recipe);
  }
}

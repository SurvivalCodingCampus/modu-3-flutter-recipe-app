import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SaveRecentSearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const SaveRecentSearchRecipesUseCase(this._recipeRepository);

  Future<void> execute(List<Recipe> recipes) async {
    await _recipeRepository.addRecentSearchRecipe(recipes);
  }
}

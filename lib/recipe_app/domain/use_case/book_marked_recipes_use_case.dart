import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';

class BookMarkedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  BookMarkedRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> execute(bool bookMark) async {
    final results = await _recipeRepository.bookMarkedRecipes(bookMark);
    return results;
  }
}

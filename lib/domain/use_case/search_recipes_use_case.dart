import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> execute(String query) async {
    List<Recipe> recipes = await _recipeRepository.findAll();

    return recipes
        .where(
          (recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}

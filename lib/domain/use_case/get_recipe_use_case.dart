import '../../data/model/recipe_model.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository repository;

  GetRecipeUseCase(this.repository);

  Future<List<Recipe>> execute() async {
    final recipe = await repository.getRecipes();
    return recipe.toList();
  }
}

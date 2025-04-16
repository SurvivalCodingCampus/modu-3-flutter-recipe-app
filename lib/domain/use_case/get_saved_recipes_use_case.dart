import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';
import '../../data/model/recipe_model.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetSavedRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> markRecipes() async {
    final allRecipes = await _recipeRepository.getRecipes();
    final savedRecipes =
        allRecipes.where((recipe) => recipe.isBookMarked).toList();
    return savedRecipes;
  }
}

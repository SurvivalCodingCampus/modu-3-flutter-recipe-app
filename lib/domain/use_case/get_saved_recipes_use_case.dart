import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const GetSavedRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> execute() async {
    return _recipeRepository.findAll();
  }
}

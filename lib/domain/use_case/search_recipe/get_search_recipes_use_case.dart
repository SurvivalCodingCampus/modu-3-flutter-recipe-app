import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class GetSearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetSearchRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> excute(String inputText) async {
    return _recipeRepository.getSearchRecipes(inputText);
  }
}

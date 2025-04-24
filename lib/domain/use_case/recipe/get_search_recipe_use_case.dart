import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetSearchRecipeUseCase {
  final RecipeRepository _repository;

  GetSearchRecipeUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<List<Recipe>> execute() async {
    return _repository.getSearchRecipes();
  }
}

import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SaveSerchRecipeUseCase {
  final RecipeRepository _repository;

  SaveSerchRecipeUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<List<Recipe>> execute(String keyword) async {
    final searchRecipes = await _repository.getRecipes();

    final filterRecipes =
        searchRecipes
            .where(
              (recipe) =>
                  recipe.title.toLowerCase().contains(keyword.toLowerCase()),
            )
            .toList();

    return _repository.saveSearchRecipes(filterRecipes);
  }
}

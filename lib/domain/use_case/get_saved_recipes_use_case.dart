import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetSavedRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute() async {
    final results = await _recipeRepository.getSaveRecipeList();
    return results
        .map(
          (items) => Recipe(
            name: items.name,
            author: items.author,
            time: items.time,
            rating: items.rating,
            image: items.image,
            category: items.category,
            ingredients: items.ingredients
          ),
        )
        .toList();
  }
}

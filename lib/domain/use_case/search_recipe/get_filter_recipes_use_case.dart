import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';

class GetFilterRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetFilterRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> excute({
    required CategoryType category,
    required Star star,
    required Time time,
  }) async {
    final List<Recipe> allRecipes = await _recipeRepository.getRecipes();

    final categoryFilter =
        category == CategoryType.all
            ? allRecipes
            : allRecipes
                .where(
                  (recipe) =>
                      recipe.category.name.toLowerCase() ==
                      category.name.toLowerCase(),
                )
                .toList();
    final starFilter =
        categoryFilter
            .where(
              (recipe) =>
                  recipe.rating >= star.minRating &&
                  recipe.rating < star.maxRating,
            )
            .toList();

    List<Recipe> sorted = [...starFilter];
    switch (time) {
      case Time.all:
        break;
      case Time.newest:
        sorted.sort((a, b) => b.id.compareTo(a.id));
        break;
      case Time.oldest:
        sorted.sort((a, b) => a.id.compareTo(b.id));
        break;
      case Time.popularity:
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    return sorted;
  }
}

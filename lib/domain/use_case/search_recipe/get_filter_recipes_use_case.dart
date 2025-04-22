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
    required String inputText,
  }) async {
    return _recipeRepository.getFilterRecipes(category, star, time, inputText);
  }
}

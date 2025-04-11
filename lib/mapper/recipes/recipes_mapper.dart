import 'package:recipe_app/dto/recipes/recipes_dto.dart';
import 'package:recipe_app/model/recipe/recipe.dart';

extension RecipesMapper on Recipes {
  Recipe toRecipe() {
    return Recipe(
      name: name ?? '',
      author: chef ?? '',
      time: time ?? '',
      rating: rating ?? 0.0,
      image: image ?? '',
    );
  }
}

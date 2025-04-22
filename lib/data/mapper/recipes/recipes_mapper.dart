import 'package:recipe_app/data/dto/recipes/recipes_dto.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

extension RecipesMapper on Recipes {
  Recipe toRecipe() {
    return Recipe(
      name: name ?? '',
      author: chef ?? '',
      time: time ?? '',
      rating: rating ?? 0.0,
      image: image ?? '',
      category: category ?? '',
    );
  }

  // Map<String,dynamic> fromRecipe({required Recipe recipe}) {
  //   return  {
  //     'name' : recipe.name,
  //     'author' : recipe.author,
  //     'time' : recipe.time,
  //     'rating' : recipe.rating,
  //     'image' : recipe.image,
  //   };
  // }
}

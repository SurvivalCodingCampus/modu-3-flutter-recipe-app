import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/model/recipe.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      title: '',
      author: name ?? '이름 없음',
      cookTimes: 20,
      imageUrl: image ?? '',
      rateStar: 4.0,
    );
  }
}


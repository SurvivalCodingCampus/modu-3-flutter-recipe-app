import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/model/recipe.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id,
      name: name,
      estimatedTime: estimatedTime,
      isFavorite: isFavorite,
      rate: rate,
      makeUserName: makeUserName,
      makeUserImageUrl: makeUserImageUrl,
      imageUrl: imageUrl,
    );
  }
}

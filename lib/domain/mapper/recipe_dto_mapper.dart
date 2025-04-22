import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/domain/model/recipe.dart';

extension RecipeDtoMapper on Recipe {
  RecipeDto toRecipeDto() {
    return RecipeDto(
      id: id,
      name: name,
      estimatedTime: estimatedTime,
      isFavorite: isFavorite,
      rate: rate,
      makeUserName: makeUserName,
      makeUserImageUrl: makeUserImageUrl,
      imageUrl: imageUrl,
      createdAt: createdAt.toIso8601String(),
      category: category.name,
    );
  }
}

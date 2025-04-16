import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/dto/recipe_dto.dart';
import 'ingredient_mapper.dart'; // IngredientDto가 있다면 여기서 toIngredient() 구현

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id ?? 0,
      category: category ?? '',
      name: name ?? '',
      image: image ?? '',
      chef: chef ?? '',
      time: time ?? '',
      rating: rating ?? 0.0,
      bookmarkStatus: bookmarkStatus ?? false,
      ingredients:
          ingredients?.map((e) => e.toIngredientAmount()).toList() ?? [],
    );
  }
}

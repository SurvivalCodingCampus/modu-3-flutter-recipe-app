import 'package:recipe_app/data/dto/ingredient_item_dto.dart';
import '../model/ingredients_model.dart';
import '../model/recipe_ingredient.dart';
import 'ingredient_mapper.dart';

extension RecipeIngredientMapper on RecipeIngredientDto {
  RecipeIngredient toRecipeIngredient() {
    return RecipeIngredient(
      ingredient:
          ingredient?.toIngredient() ??
          Ingredient(id: 0, name: '', imageUrl: ''),
      amount: amount ?? 0,
    );
  }

  static List<RecipeIngredient> fromDtoList(
    List<RecipeIngredientDto> dtos,
    int recipeId,
  ) {
    return dtos
        .where((dto) => dto.recipeId == recipeId)
        .map((dto) => dto.toRecipeIngredient())
        .toList();
  }
}

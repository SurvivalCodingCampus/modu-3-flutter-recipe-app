import 'package:recipe_app/dto/ingredients_dto.dart';
import 'package:recipe_app/mapper/ingredient_mapper.dart';
import 'package:recipe_app/model/ingredients.dart';

extension IngredientsMapper on IngredientsDto {
  Ingredients toIngredients() {
    return Ingredients(
      ingredient: ingredientDto!.toIngredient(),
      amount: amount as int,
    );
  }
}

import 'package:recipe_app/data/dto/ingredients_dto.dart';

import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/data/mapper/ingredient_mapper.dart';

extension IngredientsMapper on IngredientsDto {
  Ingredients toIngredients() {
    return Ingredients(
      ingredient: ingredientDto!.toIngredient(),
      amount: amount as int,
    );
  }
}

import 'package:recipe_app/data/dto/ingredients_dto.dart';
import 'package:recipe_app/data/mapper/ingredient_mapper.dart';
import 'package:recipe_app/domain/model/ingredient.dart';
import 'package:recipe_app/domain/model/ingredients.dart';

extension IngredientsMapper on IngredientsDto {
  Ingredients toIngredients() {
    return Ingredients(
      amount: amount ?? -1,
      ingredient:
          ingredient?.toIngredient() ??
          Ingredient(id: -1, image: '', name: '정보 없음'),
    );
  }
}

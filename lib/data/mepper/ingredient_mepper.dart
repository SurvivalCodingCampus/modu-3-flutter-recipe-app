import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/model/ingredient/ingredient.dart';

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient({int weight = 0}) {
    return Ingredient(imageUrl: image ?? '', name: name ?? '', weight: weight);
  }
}

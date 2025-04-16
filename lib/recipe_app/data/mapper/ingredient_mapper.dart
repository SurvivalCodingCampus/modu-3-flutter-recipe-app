import 'package:recipe_app/recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/recipe_app/data/model/ingredient.dart';

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(
      id: id?.toInt() ?? 0,
      name: name ?? '',
      image: image ?? '',
    );
  }
}

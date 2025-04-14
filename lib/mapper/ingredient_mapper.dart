import 'package:recipe_app/dto/ingredient_dto.dart';
import 'package:recipe_app/model/ingredient.dart';

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(
      id: id.toString(),
      name: name ?? '',
      imageUrl: imageUrl ?? '',
    );
  }
}

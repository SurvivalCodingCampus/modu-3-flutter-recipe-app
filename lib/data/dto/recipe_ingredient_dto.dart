import 'package:recipe_app/data/dto/dto.dart';

class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final num? amount;

  RecipeIngredientDto({this.ingredient, this.amount});
}

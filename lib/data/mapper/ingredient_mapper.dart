import 'package:recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/domain/model/ingredient.dart';

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(id: id ?? -1, image: image ?? '', name: name ?? '정보 없음');
  }
}

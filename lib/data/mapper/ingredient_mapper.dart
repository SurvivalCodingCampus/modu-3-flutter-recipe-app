import '../dto/ingredient_dto.dart';
import '../model/ingredients_model.dart';

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(id: id ?? 0, name: name ?? '', imageUrl: image ?? '');
  }
}

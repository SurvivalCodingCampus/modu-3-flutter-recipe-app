import 'package:recipe_app/data/dto/dto.dart';
import 'package:recipe_app/domain/model/model.dart';

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(
      id: id != null ? id!.toString() : '0',
      name: name ?? '',
      imageUrl: image ?? '',
      weight: amount != null ? amount!.toInt() : 0,
    );
  }
}

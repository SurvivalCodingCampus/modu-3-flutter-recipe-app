import 'package:recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/domain/model/ingredient.dart';

extension IngredientDtoMapper on IngredientDTO {
  Ingredient toModel() =>
      Ingredient(id: id ?? 0, name: name ?? 'N/A', imageUrl: imageUrl ?? 'N/A');
}

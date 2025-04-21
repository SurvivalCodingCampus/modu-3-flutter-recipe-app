import 'package:recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/domain/entity/ingredient.dart';

IngredientModel toIngredientModel({
  required IngredientDto dto,
  required int amount,
}) {
  return IngredientModel(
    id: dto.id?.toInt() ?? 0,
    name: dto.name ?? 'Unknown',
    image: dto.image ?? '',
  );
}

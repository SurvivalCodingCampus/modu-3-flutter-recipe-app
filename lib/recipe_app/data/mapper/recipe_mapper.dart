import 'package:recipe_app/recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/recipe_app/data/mapper/ingredient_mapper.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      category: category ?? '',
      id: id?.toInt() ?? 0,
      name: name ?? '',
      chef: chef ?? '',
      rate: rating?.toDouble() ?? 0.0,
      time: time?.toInt() ?? 0,
      image: image ?? '',
      ingredients:
          ingredients == null
              ? []
              : ingredients!
                  .cast<Map<String, dynamic>>()
                  .map((e) => IngredientDto.fromJson(e['ingredient']))
                  .map((e) => e.toIngredient())
                  .toList(),
      bookMarked: bookMarked ?? false,
    );
  }
}

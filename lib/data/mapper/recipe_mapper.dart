import 'package:recipe_app/data/model/category.dart';

import 'ingredient_mapper.dart';
import 'package:recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/model/recipe.dart';

extension RecipeMapper on RecipeDTO {
  Recipe toModel() {
    return Recipe(
      id: id!,
      name: name ?? 'N/A',
      imageUrl: imageUrl ?? 'N/A',
      ingredients:
          ingredients
              .cast<Map<String, dynamic>>()
              .map((e) => IngredientDTO.fromJson(e['ingredient']))
              .map((e) => e.toModel())
              .toList(),
      category:
          category != null ? Category.fromString(category!) : Category.none,
      rating: rating ?? 0.0,
      cookTime:
          cookTime != null
              ? (cookTime is String
                  ? int.tryParse(cookTime!.split(' ')[0]) ?? 0
                  : 0)
              : 0,
    );
  }
}

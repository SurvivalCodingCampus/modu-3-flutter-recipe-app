import 'package:recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/dto/recipe_ingredient_dto.dart';
import 'package:recipe_app/domain/model/ingredient.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/recipe_ingredient.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id?.toInt() ?? -1,
      category: category ?? '',
      name: name ?? '',
      image: image ?? '',
      chef: chef ?? '',
      time: time ?? '',
      rating: (rating ?? 0).toDouble(),
      ingredients:
          ingredients?.map((e) => e.toRecipeIngredient()).toList() ?? [],
    );
  }
}

extension RecipeIngredientMapper on RecipeIngredientDto {
  RecipeIngredient toRecipeIngredient() {
    return RecipeIngredient(
      ingredient: (ingredient ?? IngredientDto()).toIngredient(),
      amount: amount?.toInt() ?? 0,
    );
  }
}

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(
      id: id?.toInt() ?? -1,
      name: name ?? '',
      image: image ?? '',
    );
  }
}

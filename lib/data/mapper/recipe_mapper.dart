import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';

extension RecipeDtoMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: (id is int) ? id as int : -1,
      category: category ?? 'Unknown',
      name: name ?? 'Unnamed Recipe',
      image: image ?? '',
      chef: chef ?? 'Anonymous',
      time: time ?? 'Unknown',
      rating: (rating is num) ? (rating as num).toDouble() : 0.0,
      ingredients: ingredients
              ?.map((e) => e.toRecipe())
              .where((e) => e != null)
              .cast<RecipeIngredient>()
              .toList() ??
          [],
    );
  }
}

extension RecipeIngredientDtoMapper on RecipeIngredientDto {
  RecipeIngredient? toRecipe() {
    final ingredientModel = ingredient?.toRecipe();
    if (ingredientModel == null || amount == null) return null;

    return RecipeIngredient(
      ingredient: ingredientModel,
      amount: (amount is int) ? amount as int : (amount?.round() ?? 0),
    );
  }
}

extension IngredientDtoMapper on IngredientDto {
  Ingredient? toRecipe() {
    if (id == null || name == null) return null;
    return Ingredient(
      id: (id is int) ? id as int : (id?.round() ?? -1),
      name: name!,
      image: image ?? '',
    );
  }
}
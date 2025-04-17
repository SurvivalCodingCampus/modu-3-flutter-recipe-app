import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/enums/category.dart';
import 'package:recipe_app/data/mapper/ingredients_mapper.dart';
import 'package:recipe_app/domain/model/recipe.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id ?? -1,
      category: category ?? Category.unknown,
      chef: chef ?? '정보 없음',
      foodName: name ?? '정보 없음',
      image: image ?? '',
      ingredients: ingredients?.map((e) => e.toIngredients()).toList() ?? [],
      rate: rating ?? -1.1,
      time: time ?? '정보 없음',
    );
  }
}

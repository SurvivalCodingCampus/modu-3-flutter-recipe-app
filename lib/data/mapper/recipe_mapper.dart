import 'package:recipe_app/data/dto/ingredient_item_dto.dart';
import 'package:recipe_app/data/mapper/procedure_mapper.dart';
import 'package:recipe_app/data/mapper/recipe_ingredient_mapper.dart';
import '../dto/procedure_dto.dart';
import '../dto/recipe_dto.dart';
import '../model/recipe_model.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe(
    List<ProcedureStepDto> allProcedures,
    List<RecipeIngredientDto> allIngredients,
  ) {
    final procedures = ProcedureMapper.fromDtoList(allProcedures, id ?? 0);
    final ingredients = RecipeIngredientMapper.fromDtoList(
      allIngredients,
      id ?? 0,
    );

    return Recipe(
      id: id ?? 0,
      category: category ?? '',
      name: name ?? '',
      imageUrl: image ?? '',
      chef: chef ?? '',
      time: time ?? '',
      rating: rating ?? 0.0,
      ingredients: ingredients,
      procedures: procedures,
    );
  }

  static List<Recipe> fromDtoList(
    List<RecipeDto> dtos,
    List<ProcedureStepDto> allProcedures,
    List<RecipeIngredientDto> allIngredients,
  ) {
    return dtos
        .map((dto) => dto.toRecipe(allProcedures, allIngredients))
        .toList();
  }
}

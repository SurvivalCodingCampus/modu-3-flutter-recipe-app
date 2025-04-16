import 'package:recipe_app/core/modules/exception/custom_exception.dart';
import 'package:recipe_app/feature/receipe/domain/model/ingredient/ingredient.dart';
import 'package:recipe_app/feature/receipe/domain/model/ingredient/ingredient_amount.dart';
import 'package:recipe_app/feature/receipe/data/dto/ingredient/ingredient_amount_dto.dart';
import 'package:recipe_app/feature/receipe/data/dto/ingredient/ingredient_dto.dart';

extension IngredientAmountMapper on IngredientAmountDto {
  IngredientAmount toIngredientAmount() {
    return IngredientAmount(
      ingredient:
          ingredient?.toIngredient() ?? (throw const NetworkException()),
      amount: amount ?? 0,
    );
  }
}

extension IngredientMapper on IngredientDto {
  Ingredient toIngredient() {
    return Ingredient(id: id ?? 0, name: name ?? '', image: image ?? '');
  }
}

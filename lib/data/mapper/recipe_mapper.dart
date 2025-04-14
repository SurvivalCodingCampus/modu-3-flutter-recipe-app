import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/ingredient_with_amount.dart';

import '../type/category_filter.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: (id ?? 0).toInt(),
      category: CategoryFilter.values.firstWhere(
        (e) => e.name == category,
        orElse: () => CategoryFilter.Unknown,
      ),
      name: name ?? '',
      time: time ?? '',
      chef: chef ?? '',
      rating: (rating ?? 0).toDouble(),
      image: image ?? '',

      ingredients:
          ingredients
              ?.map(
                // 빈 리스트이면 어차피 map 작동 안함.
                (e) => IngredientWithAmount(
                  ingredient: Ingredient(
                    id: (e.ingredient?.id ?? 0).toInt(),
                    name: e.ingredient?.name ?? '',
                    image: e.ingredient?.image ?? '',
                  ),
                  amount: (e.amount ?? 0).toInt(),
                ),
              )
              .toList() ??
          [], // List<IngredientWithAmountDto>가 null인지 확인
    );
  }
}

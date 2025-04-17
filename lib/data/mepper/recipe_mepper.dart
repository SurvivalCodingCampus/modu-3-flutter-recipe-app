import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/mepper/ingredient_mepper.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/model/ingredient/ingredient.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      recipeId: id ?? -1,
      title: name ?? '',
      ingredient:
          (ingredients ?? []).map((e) {
            final dto = e.ingredient;
            final amount = e.amount ?? 0;
            return dto?.toIngredient(weight: amount) ??
                Ingredient(imageUrl: '', name: '', weight: 0);
          }).toList(),
      time:
          int.tryParse(
            RegExp(r'\d+').firstMatch(time ?? '')?.group(0) ?? '0',
          ) ??
          0,
      rating: rating ?? 0.0,
      category: categorySwitch(category),
      userName: chef ?? '알 수 없음',
      createdAt: DateTime.now(),
      thumbNailUrl: image ?? '',
    );
  }
}

import '../dto/recipe_dto.dart';
import '../model/ingredients_model.dart';
import '../model/recipe_ingredient.dart';
import '../model/recipe_model.dart';

class ToRecipe {
  static Recipe fromDto(RecipeDto dto, {bool isBookMarked = true}) {
    return Recipe(
      id: dto.id ?? 0,
      category: dto.category ?? '',
      name: dto.name ?? '',
      imageUrl: dto.image ?? '',
      chef: dto.chef ?? '',
      time: dto.time ?? '',
      rating: dto.rating ?? 0.0,
      ingredients:
          (dto.ingredients ?? []).map((e) {
            final ing = e.ingredient;
            return RecipeIngredient(
              ingredient: Ingredient(
                id: ing?.id ?? 0,
                name: ing?.name ?? '',
                imageUrl: ing?.image ?? '',
              ),
              amount: e.amount ?? 0,
            );
          }).toList(),
      isBookMarked: isBookMarked,
    );
  }
}

import 'package:recipe_app/dto/ingredients_dto.dart';
import 'package:recipe_app/dto/pictures_dto.dart';
import 'package:recipe_app/dto/recipe_dto.dart';
import 'package:recipe_app/mapper/ingredients_mapper.dart';
import 'package:recipe_app/mapper/picture_mapper.dart';
import 'package:recipe_app/data/model/ingredients.dart';
import 'package:recipe_app/data/model/pictures.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/presentation/component/button/enum/category.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id as int,
      title: title ?? '',
      pictures: fromPictures(picture!),
      rating: rating as double,
      time: time as int,
      chef: chef ?? '',
      ingredients: fromIngredients(ingredients!),
      category: categorySwitch(category ?? ''),
    );
  }
}

List<Ingredients> fromIngredients(List<IngredientsDto> dto) {
  return dto.map((e) => e.toIngredients()).toList();
}

Pictures fromPictures(PicturesDto dto) {
  return dto.toPictures();
}

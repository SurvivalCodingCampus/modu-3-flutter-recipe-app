import 'package:recipe_app/data/dto/ingredients_dto.dart';
import 'package:recipe_app/data/dto/pictures_dto.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

import 'package:recipe_app/data/mapper/ingredients_mapper.dart';
import 'package:recipe_app/data/mapper/picture_mapper.dart';

import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/domain/model/pictures.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import 'package:recipe_app/presentation/component/button/enum/category_type.dart';

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
      step: [],
    );
  }
}

List<Ingredients> fromIngredients(List<IngredientsDto> dto) {
  return dto.map((e) => e.toIngredients()).toList();
}

Pictures fromPictures(PicturesDto dto) {
  return dto.toPictures();
}

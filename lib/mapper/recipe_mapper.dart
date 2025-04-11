import 'package:recipe_app/dto/ingredients_dto.dart';
import 'package:recipe_app/dto/pictures_dto.dart';
import 'package:recipe_app/dto/recipe_dto.dart';
import 'package:recipe_app/model/ingredients.dart';
import 'package:recipe_app/model/pictures.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/presentation/component/button/enum/category.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id as int,
      title: title ?? '',
      pictures: _fromPictures(picture!),
      rating: rating as double,
      time: time as int,
      chef: chef ?? '',
      ingredients: _fromIngredients(ingredients!),
      category: categorySwitch(category ?? ''),
    );
  }
}

List<Ingredients> _fromIngredients(List<IngredientsDto> dto) {
  return dto.map((e) => e as Ingredients).toList();
}

Pictures _fromPictures(PicturesDto dto) {
  return dto as Pictures;
}

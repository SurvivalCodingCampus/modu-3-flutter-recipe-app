import 'package:recipe_app/data/dto/recipe_dto.dart';

import '../../domain/model/recipe.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      title: name ?? '제목 없음',
      author: chef ?? '이름 없음',
      cookTimes: time ?? '시간 없음',
      imageUrl: image ?? '이미지 없음',
      rateStar: rating ?? 4.0,
    );
  }
}


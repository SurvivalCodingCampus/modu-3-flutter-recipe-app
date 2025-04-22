import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';

extension RecipeMapper on RecipeDto {
  Recipe toRecipe() {
    return Recipe(
      id: id,
      name: name,
      estimatedTime: estimatedTime,
      isFavorite: isFavorite,
      rate: rate,
      makeUserName: makeUserName,
      makeUserImageUrl: makeUserImageUrl,
      videoUrl: videoUrl,
      imageUrl: imageUrl,
      createdAt: _parseDateTime(createdAt),
      category: CategoryFilterTypeExtension.fromString(category),
    );
  }

  DateTime _parseDateTime(String dateTimeStr) {
    try {
      return DateTime.parse(dateTimeStr);
    } catch (e) {
      return DateTime.fromMicrosecondsSinceEpoch(0);
    }
  }
}
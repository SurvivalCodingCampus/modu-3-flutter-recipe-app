import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/ingredients.dart';

import '../../data/enums/category.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String foodName,
    required Category category,
    required String chef,
    required String time,
    required double rate,
    required String image,
    required List<Ingredients> ingredients,
  }) = _Recipe;
}

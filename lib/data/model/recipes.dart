import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredients.dart';

part 'recipes.freezed.dart';

part 'recipes.g.dart';

@freezed
abstract class Recipes with _$Recipes {
  const factory Recipes({
    required String category,
    required int id,
    required String name,
    required String image,
    required String chef,
    required String time,
    required double rating,
    required List<Ingredients> ingredients,

  }) = _Recipes;
  
  factory Recipes.fromJson(Map<String, Object?> json) => _$RecipesFromJson(json); 
}
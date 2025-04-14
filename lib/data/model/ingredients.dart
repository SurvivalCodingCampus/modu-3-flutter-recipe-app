
import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient.dart';

part 'ingredients.freezed.dart';

part 'ingredients.g.dart';

@freezed
abstract class Ingredients with _$Ingredients {
  const factory Ingredients({
    required Ingredient ingredient,
    required int amount,

  }) = _Igredients;
  
  factory Ingredients.fromJson(Map<String, Object?> json) => _$IngredientsFromJson(json);
}

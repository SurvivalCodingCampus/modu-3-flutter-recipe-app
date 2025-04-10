import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String id,
    required String name,
    required String imageUrl,
    required int weight,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

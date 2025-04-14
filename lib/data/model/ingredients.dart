import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/ingredient.dart';

part 'ingredients.freezed.dart';
part 'ingredients.g.dart';

@freezed
abstract class Ingredients with _$Ingredients{
  const factory Ingredients({
    @Default(Ingredient()) final Ingredient ingredient,
    @Default(0) final int amount,
  }) = _Ingredients;

  factory Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);
}
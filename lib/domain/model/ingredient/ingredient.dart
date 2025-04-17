// [Ingredient] 요리재료 정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Ingredient with _$Ingredient {
  final String imageUrl;
  final String name;
  final int weight;

  const Ingredient({
    required this.imageUrl,
    required this.name,
    required this.weight,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

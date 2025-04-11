import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  final int id;
  final String name;
  final String image;

  const Ingredient({required this.id, required this.name, required this.image});
}

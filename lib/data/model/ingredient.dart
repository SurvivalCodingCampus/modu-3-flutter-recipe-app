import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

@freezed
class Ingredient with _$Ingredient {
  Ingredient({required this.id, required this.name, required this.image});

  final int id;
  final String name;
  final String image;
}

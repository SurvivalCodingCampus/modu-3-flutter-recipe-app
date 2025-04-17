import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Ingredient with _$Ingredient {
  final int id;
  final String name;
  final String image;

  const Ingredient({required this.id, required this.name, required this.image});
}

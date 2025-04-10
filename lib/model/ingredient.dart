import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Ingredient with _$Ingredient {
  final String id;
  final String name;
  final String imageUrl;
  final int weight;

  Ingredient({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
  });
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String foodName,
    required String chef,
    required int time,
    required double rate,
    required String image,
  }) = _Recipe;
}

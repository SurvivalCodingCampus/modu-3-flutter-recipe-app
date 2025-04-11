
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
   factory Recipe({
    required String name,
    required String author,
    required String time,
    required double rating,
    required String image,
}) = _Recipe;
}

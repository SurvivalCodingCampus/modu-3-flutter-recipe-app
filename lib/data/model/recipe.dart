import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  final String title;
  final String author;
  final int cookTimes;
  final String imageUrl;
  final double rateStar;

  const Recipe({
    required this.title,
    required this.author,
    required this.cookTimes,
    required this.imageUrl,
    required this.rateStar,
  });
}

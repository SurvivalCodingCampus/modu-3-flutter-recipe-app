import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/media.dart';
import 'package:recipe_app/data/model/user.dart';

class Recipe {
  final String title;
  final List<Ingredient> ingredient;
  final int time;
  final double rating;
  final User user;
  final Media media;

  // final List<Review> reviews
  // final List<String> recipeStep
  // final List<Category> categoryList
  // final DateTime createdAt;
  // final List<Review> review;

  Recipe({
    required this.title,
    required this.ingredient,
    required this.time,
    required this.rating,
    required this.user,
    required this.media,
  });
}

import 'package:flutter/foundation.dart';
import 'package:recipe_app/feature/receipe/domain/model/ingredient/ingredient_amount.dart';

class Recipe {
  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final bool bookmarkStatus;
  final List<IngredientAmount> ingredients;
  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.bookmarkStatus,
    required this.ingredients,
  });

  Recipe copyWith({
    int? id,
    String? category,
    String? name,
    String? image,
    String? chef,
    String? time,
    double? rating,
    bool? bookmarkStatus,
    List<IngredientAmount>? ingredients,
  }) {
    return Recipe(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      image: image ?? this.image,
      chef: chef ?? this.chef,
      time: time ?? this.time,
      rating: rating ?? this.rating,
      bookmarkStatus: bookmarkStatus ?? this.bookmarkStatus,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  String toString() {
    return 'Recipe(id: $id, category: $category, name: $name, image: $image, chef: $chef, time: $time, rating: $rating, bookmarkStatus: $bookmarkStatus, ingredients: $ingredients)';
  }

  @override
  bool operator ==(covariant Recipe other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.category == category &&
        other.name == name &&
        other.image == image &&
        other.chef == chef &&
        other.time == time &&
        other.rating == rating &&
        other.bookmarkStatus == bookmarkStatus &&
        listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        name.hashCode ^
        image.hashCode ^
        chef.hashCode ^
        time.hashCode ^
        rating.hashCode ^
        bookmarkStatus.hashCode ^
        ingredients.hashCode;
  }
}

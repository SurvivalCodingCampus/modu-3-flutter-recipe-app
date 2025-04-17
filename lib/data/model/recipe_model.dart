import 'package:recipe_app/data/model/procedure_model.dart';
import 'package:recipe_app/data/model/recipe_ingredient.dart';

class Recipe {
  final String category;
  final int id;
  final String name;
  final String imageUrl;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;
  final List<Procedure> procedures;
  final bool isBookMarked;

  const Recipe({
    required this.category,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
    required this.procedures,
    this.isBookMarked = true,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recipe &&
          runtimeType == other.runtimeType &&
          category == other.category &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl &&
          chef == other.chef &&
          time == other.time &&
          rating == other.rating &&
          ingredients == other.ingredients &&
          procedures == other.procedures;

  @override
  int get hashCode =>
      category.hashCode ^
      id.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      chef.hashCode ^
      time.hashCode ^
      rating.hashCode ^
      ingredients.hashCode ^
      procedures.hashCode;

  Recipe copyWith({
    String? category,
    int? id,
    String? name,
    String? imageUrl,
    String? chef,
    String? time,
    double? rating,
    List<RecipeIngredient>? ingredients,
    List<Procedure>? procedures,
    bool? isBookMarked,
  }) {
    return Recipe(
      category: category ?? this.category,
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      chef: chef ?? this.chef,
      time: time ?? this.time,
      rating: rating ?? this.rating,
      ingredients: ingredients ?? this.ingredients,
      procedures: procedures ?? this.procedures,
      isBookMarked: isBookMarked ?? this.isBookMarked,
    );
  }

  @override
  String toString() {
    return 'Recipe{category: $category, id: $id, name: $name, imageUrl: $imageUrl, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients, procedures: $procedures}';
  }
}

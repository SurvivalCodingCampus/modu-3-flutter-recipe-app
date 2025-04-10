class Recipe {
  final String category;
  final String id;
  final String name;
  final String imageUrl;
  final String chef;
  final String time;
  final double rating;
  final List<String> ingredients;
  final List<String> procedures;

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
    String? id,
    String? name,
    String? imageUrl,
    String? chef,
    String? time,
    double? rating,
    List<String>? ingredients,
    List<String>? procedures,
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
    );
  }

  @override
  String toString() {
    return 'Recipe{category: $category, id: $id, name: $name, imageUrl: $imageUrl, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients, procedures: $procedures}';
  }
}

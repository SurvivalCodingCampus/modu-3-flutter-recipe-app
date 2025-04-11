class Ingredient {
  final num? id;
  final String? name;
  final String? image;

  Ingredient({this.id, this.name, this.image});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }
}

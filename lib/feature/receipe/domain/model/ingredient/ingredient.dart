class Ingredient {
  final int id;
  final String name;
  final String image;

  Ingredient({required this.id, required this.name, required this.image});

  Ingredient copyWith({int? id, String? name, String? image}) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  String toString() => 'Ingredient(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Ingredient other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}

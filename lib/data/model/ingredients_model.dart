class Ingredient {
  final int id;
  final String name;
  final String imageUrl;

  const Ingredient({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Ingredient copyWith({int? id, String? name, String? imageUrl}) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredient &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'Ingredient{id: $id, name: $name, imageUrl: $imageUrl, }';
  }
}

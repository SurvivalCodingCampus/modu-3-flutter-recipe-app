class IngredientDto {
  final int? id;
  final String? name;
  final String? image;

  IngredientDto({this.id, this.name, this.image});

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientDto &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          image == other.image;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}

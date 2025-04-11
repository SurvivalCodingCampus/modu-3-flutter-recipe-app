class Ingredients {
  final String id;
  final String name;
  final String imageUrl;
  final String amount;

  const Ingredients({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.amount,
  });

  Ingredients copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? amount,
  }) {
    return Ingredients(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredients &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl &&
          amount == other.amount;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ amount.hashCode;

  @override
  String toString() {
    return 'Ingredients{id: $id, name: $name, imageUrl: $imageUrl, amount: $amount}';
  }
}

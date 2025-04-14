class Procedure {
  final int recipeId;
  final List<String> steps;

  Procedure({required this.recipeId, required this.steps});

  Procedure copyWith({int? recipeId, List<String>? steps}) {
    return Procedure(
      recipeId: recipeId ?? this.recipeId,
      steps: steps ?? this.steps,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Procedure) return false;
    return runtimeType == other.runtimeType &&
        recipeId == other.recipeId &&
        _listEquals(steps, other.steps);
  }

  @override
  int get hashCode => recipeId.hashCode ^ steps.hashCode;

  @override
  String toString() => 'Procedure(recipeId: $recipeId, steps: $steps)';

  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
}

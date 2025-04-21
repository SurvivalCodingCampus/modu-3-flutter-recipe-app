enum CategoryFilter {
  all,
  cereal,
  vegetables,
  dinner,
  chinese,
  localDish,
  fruit,
  breakfast,
  spanish,
  lunch,
}

extension CategoryFilterExt on CategoryFilter {
  String get label {
    switch (this) {
      case CategoryFilter.all: return 'All';
      case CategoryFilter.cereal: return 'Cereal';
      case CategoryFilter.vegetables: return 'Vegetables';
      case CategoryFilter.dinner: return 'Dinner';
      case CategoryFilter.chinese: return 'Chinese';
      case CategoryFilter.localDish: return 'Local Dish';
      case CategoryFilter.fruit: return 'Fruit';
      case CategoryFilter.breakfast: return 'Breakfast';
      case CategoryFilter.spanish: return 'Spanish';
      case CategoryFilter.lunch: return 'Lunch';
    }
  }
}

CategoryFilter categoryFilterFromJson(String value) =>
    CategoryFilter.values.firstWhere((e) => e.name == value);

String categoryFilterToJson(CategoryFilter filter) => filter.name;
enum CategoryFilterType {
  all,
  cereal,
  vegetables,
  dinner,
  chinese,
  localDish,
  fruit,
  breakFast,
  spanish,
  lunch;

  bool get hasStar {
    switch (this) {
      case dinner:
        return true;
      default:
        return false;
    }
  }

  String get name {
    return switch (this) {
      all => 'All',
      cereal => 'Cereal',
      vegetables => 'Vegetables',
      dinner => 'Dinner',
      chinese => 'Chinese',
      localDish => 'Local Dish',
      fruit => 'Fruit',
      breakFast => 'BreakFast',
      spanish => 'Spanish',
      lunch => 'Lunch',
    };
  }
}

extension CategoryFilterTypeExtension on CategoryFilterType {
  static CategoryFilterType fromString(String value) {
    final normalized = value.trim();

    switch (normalized) {
      case 'Cereal':
        return CategoryFilterType.cereal;
      case 'Vegetables':
        return CategoryFilterType.vegetables;
      case 'Dinner':
        return CategoryFilterType.dinner;
      case 'Chinese':
        return CategoryFilterType.chinese;
      case 'Local Dish':
        return CategoryFilterType.localDish;
      case 'Fruit':
        return CategoryFilterType.fruit;
      case 'BreakFast':
        return CategoryFilterType.breakFast;
      case 'Spanish':
        return CategoryFilterType.spanish;
      case 'Lunch':
        return CategoryFilterType.lunch;
      case 'All':
        return CategoryFilterType.all;
      default:
        return CategoryFilterType.all;
    }
  }
}
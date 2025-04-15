enum CategoryType {
  all,
  cereal,
  vegetables,
  dinner,
  chinese,
  localDish,
  fruit,
  breakFast,
  spanish,
  lunch,
}

CategoryType categorySwitch(String? categroy) {
  switch (categroy?.toLowerCase()) {
    case 'all':
      return CategoryType.all;
    case 'cereal':
      return CategoryType.cereal;
    case 'vegetables':
      return CategoryType.vegetables;
    case 'dinner':
      return CategoryType.dinner;
    case 'chinese':
      return CategoryType.chinese;
    case 'localDish':
      return CategoryType.localDish;
    case 'fruit':
      return CategoryType.fruit;
    case 'breakFast':
      return CategoryType.breakFast;
    case 'spanish':
      return CategoryType.spanish;
    case 'lunch':
      return CategoryType.lunch;
    case '':
      return CategoryType.all;
    case null:
      return CategoryType.all;
    default:
      return CategoryType.all;
  }
}

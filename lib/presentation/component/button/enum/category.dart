enum Category {
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

Category categorySwitch(String? categroy) {
  switch (categroy?.toLowerCase()) {
    case 'all':
      return Category.all;
    case 'cereal':
      return Category.cereal;
    case 'vegetables':
      return Category.vegetables;
    case 'dinner':
      return Category.dinner;
    case 'chinese':
      return Category.chinese;
    case 'localDish':
      return Category.localDish;
    case 'fruit':
      return Category.fruit;
    case 'breakFast':
      return Category.breakFast;
    case 'spanish':
      return Category.spanish;
    case 'lunch':
      return Category.lunch;
    case '':
      return Category.all;
    case null:
      return Category.all;
    default:
      return Category.all;
  }
}

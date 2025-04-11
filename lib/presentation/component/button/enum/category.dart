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
  switch (categroy) {
    case 'All':
      return Category.all;
    case 'Cereal':
      return Category.cereal;
    case 'Vegetables':
      return Category.vegetables;
    case 'Dinner':
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

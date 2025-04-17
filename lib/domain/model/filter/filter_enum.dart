enum Time { all, newest, oldest, popularity }

Time timeSwitch(String? time) {
  switch (time) {
    case 'All':
      return Time.all;
    case 'Newest':
      return Time.newest;
    case 'Oldest':
      return Time.oldest;
    case 'Popularity':
      return Time.popularity;
    default:
      return Time.all;
  }
}

// enum Rate { one, two, three, four, five, all }

// Rate rateSwitch(String? rate) {
//   switch (rate) {
//     case '1':
//       return Rate.one;
//     case '2':
//       return Rate.two;
//     case '3':
//       return Rate.three;
//     case '4':
//       return Rate.four;
//     case '5':
//       return Rate.five;
//     default:
//       return Rate.all;
//   }
// }

enum Category {
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
    case 'c':
      return Category.chinese;
    case 'localDish':
      return Category.localDish;
    case 'fruit':
      return Category.fruit;
    case 'BreakFast':
      return Category.breakfast;
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

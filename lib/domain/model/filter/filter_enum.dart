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

enum Category {
  all,
  indian,
  asian,
  chinese,
  japanese,
  british,
  italian,
  breakfast,
  french,
}

Category categorySwitch(String? categroy) {
  switch (categroy) {
    case 'All':
      return Category.all;
    case 'Indian':
      return Category.indian;
    case 'Asian':
      return Category.asian;
    case 'Chinese':
      return Category.chinese;
    case 'Japanese':
      return Category.japanese;
    case 'British':
      return Category.british;
    case 'Italian':
      return Category.italian;
    case 'BreakFast':
      return Category.breakfast;
    case 'French':
      return Category.french;
    default:
      return Category.all;
  }
}

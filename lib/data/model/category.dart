enum Category {
  indian,
  asian,
  chinese,
  japanese,
  american,
  british,
  italian,
  french,
  none;

  static Category fromString(String value) {
    switch (value.trim().toLowerCase()) {
      case 'indian':
        return Category.indian;
      case 'asian':
        return Category.asian;
      case 'chinese':
        return Category.chinese;
      case 'japanese':
        return Category.japanese;
      case 'american':
        return Category.american;
      case 'british':
        return Category.british;
      case 'italian':
        return Category.italian;
      case 'french':
        return Category.french;
      default:
        return Category.none;
    }
  }
}

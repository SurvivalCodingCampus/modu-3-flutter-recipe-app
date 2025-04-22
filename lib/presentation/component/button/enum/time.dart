enum Time { all, newest, oldest, popularity }

extension TimeFeature on Time {
  String get label {
    switch (this) {
      case Time.all:
        return 'All';
      case Time.newest:
        return 'Newest';
      case Time.oldest:
        return 'Oldest';
      case Time.popularity:
        return 'Popularity';
    }
  }
}

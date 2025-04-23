enum Star { five, four, three, two, one }

extension Rating on Star {
  double get minRating {
    switch (this) {
      case Star.one:
        return 1.0;
      case Star.two:
        return 2.0;
      case Star.three:
        return 3.0;
      case Star.four:
        return 4.0;
      case Star.five:
        return 5.0;
    }
  }

  double get maxRating => minRating + 1;
}

enum Star { five, four, three, two, one }

int fromStar(Star star) {
  switch (star) {
    case Star.one:
      return 1;
    case Star.two:
      return 2;
    case Star.three:
      return 3;
    case Star.four:
      return 4;
    case Star.five:
      return 5;
  }
}

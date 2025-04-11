import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/components.dart'
    show RecipeCard;

import '../../test.dart';

void main() {
  const String title = 'Test';
  const String author = 'Test Author';
  const int cookTime = 30;
  const int rating = 5;
  const String imagePath = 'assets/images/card-1.png';

  testWidgets('RecipeCard 렌더링이 정상적으로 이루어져야한다.', (WidgetTester tester) async {
    await tester.pumpWidget(
      TestClass(
        child: RecipeCard(
          title: title,
          author: author,
          cookTime: cookTime,
          imagePath: imagePath,
          rating: rating,
          onBookmark: () {},
        ),
      ),
    );

    expect(find.byType(RecipeCard), findsOneWidget);
  });

  testWidgets('RecipeCard의 북마크 버튼을 탭하면 콜백 함수가 count를 증가시켜야한다.', (
    WidgetTester tester,
  ) async {
    int count = 0;

    await tester.pumpWidget(
      TestClass(
        child: RecipeCard(
          title: title,
          author: author,
          cookTime: cookTime,
          imagePath: imagePath,
          rating: rating,
          onBookmark: () {
            count++;
          },
        ),
      ),
    );

    await tester.tap(find.byKey(Key('bookmark_button')));
    expect(count, 1);
  });
}

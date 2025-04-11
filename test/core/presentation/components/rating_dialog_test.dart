import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/presentation/components/rating_dialog.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';

void main() {
  group('레시피 레이팅 다이얼로그 테스트 : ', () {
    testWidgets('제대로 존재해야한다.', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: 'Rating recipe',
              actionName: 'Send',
              onChange: (int value) {},
            ),
          ),
        ),
      );

      expect(find.text('Rating recipe'), findsOneWidget);
      expect(find.text('Send'), findsOneWidget);
    });
    testWidgets('별점을 매기지 않으면 콜백이 작동하면 안 된다.', (tester) async {
      int starCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: 'Rating recipe',
              actionName: 'Send',
              onChange: (int value) {
                starCount = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SmallButton));
      await tester.pump();

      if (starCount != 0) {
        fail('별점을 매기지 않고 눌렀을 경우 작동하지 않아야 한다.');
      }

      expect(starCount, 0);
    });
    testWidgets('별점을 매기면 별점의 값을 받아온다.', (tester) async {
      int starCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: 'Rating recipe',
              actionName: 'Send',
              onChange: (int value) {
                starCount = value;
              },
            ),
          ),
        ),
      );

      final Finder findByIcon = find.byIcon(Icons.star_border_outlined);

      await tester.tap(findByIcon.at(2));
      await tester.pump();
      await tester.tap(find.byType(SmallButton));
      await tester.pump();

      expect(starCount, 3);
    });
  });
}

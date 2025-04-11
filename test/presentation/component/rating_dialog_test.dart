import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';

import '../../test.dart';

void main() {
  testWidgets('RatingDialog 렌더링이 정상적으로 이루어져야한다.', (WidgetTester tester) async {
    await tester.pumpWidget(
      TestClass(
        child: RatingDialog(
          title: 'Test',
          onSubmit: (int rating) {},
          buttonName: 'Submit',
        ),
      ),
    );

    expect(find.text('Test'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
  });

  testWidgets('Rating 변경 후 제출 시 콜백 함수가 Rating을 반환해야한다.', (
    WidgetTester tester,
  ) async {
    int rating = -1;

    await tester.pumpWidget(
      TestClass(
        child: RatingDialog(
          title: 'Test',
          onSubmit: (int value) {
            rating = value;
          },
          buttonName: 'Submit',
        ),
      ),
    );

    await tester.tap(find.byType(Icon).last);
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    expect(rating, 5);
  });
}

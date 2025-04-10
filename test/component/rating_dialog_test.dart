import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';

void main() {
  testWidgets('Rating Dialog 테스트', (tester) async {
    int count = 0;
    final ratingDialog = RatingDialog(
      title: 'Rate Recipe',
      onTap: () {
        count++;
      },
    );

    // 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ratingDialog)));

    // RatingDialog가 존재하는지 확인.
    expect(find.byType(RatingDialog), findsOneWidget);

    // RatingDialog를 탭합니다.
    await tester.tap(find.text('Send'));
    await tester.pump();

    expect(find.text('Rate Recipe'), findsOneWidget);
    expect(count, 1);
  });
}

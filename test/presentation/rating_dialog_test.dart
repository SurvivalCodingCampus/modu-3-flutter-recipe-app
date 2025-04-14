import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentaiton/component/rating_dialog.dart';

void main() {
  testWidgets('별점 dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RatingDialog(
            rating: Rating(
              title: 'Rate recipe',
              actionName: 'send',
              onChange: (value) {
                print('$value');
              },
            ),
          ),
        ),
      ),
    );

    expect(find.text('Rate recipe'), findsOneWidget);
    expect(find.text('send'), findsOneWidget);

    // 별점 아이콘이 존재하는지 확인
    expect(find.byIcon(Icons.star_border), findsWidgets);

    // 별점 탭 동작 테스트
    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pump();
    // 탭 후 별점 변화 확인
    expect(find.byIcon(Icons.star), findsOneWidget);

    // 버튼 동작 테스트
    await tester.tap(find.text('send'));
    await tester.pump();
    // 동작 검증 로직 추가
  });
}

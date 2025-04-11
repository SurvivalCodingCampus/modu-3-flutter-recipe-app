import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/alert/rating_dialog.dart';

void main() {
  testWidgets('rating dialog test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RatingDialog(title: '별점을 남겨주세요', actionName: '보내기'),
      ),
    );
    expect(find.text('별점을 남겨주세요'), findsOneWidget);
    expect(find.byIcon(Icons.star_border_outlined), findsNWidgets(5));

    await tester.tap(find.byIcon(Icons.star_border_outlined).at(0));
    await tester.pump();
    expect(find.byIcon(Icons.star), findsNWidgets(1));
  });
}

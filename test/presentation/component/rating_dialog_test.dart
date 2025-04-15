import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';

void main() {
  group('RatingDialog widget test', () {
    testWidgets('RatingDialog 존재.', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: 'Rating recipe',
              buttonTitle: 'Send',
              onChange: (int value) {},
            ),
          ),
        ),
      );

      expect(find.text('Rating recipe'), findsOneWidget);
      expect(find.text('Send'), findsOneWidget);
    });
  });
}

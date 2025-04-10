import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-10/presentation/component/rating_dialog.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    int selectedRate = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => RatingDialog(
                    onchange: (rate) {
                      selectedRate = rate;
                    },
                  ),
                );
              },
              child: Text('별점주기'),
            );
          },
        ),
      ),
    );
    await tester.tap(find.text('별점주기'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Image).at(0));
    await tester.pump();

    await tester.tap(find.text('Send'));
    await tester.pumpAndSettle();

    expect(selectedRate, 1);

  });
}
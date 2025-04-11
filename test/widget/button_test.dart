import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';

void main() {
  testWidgets('button widget test', (tester) async {
    final text = 'button';
    bool value = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            text: text,
            onClick: () {
              value = true;
            },
          ),
        ),
      ),
    );
    final finder = find.text(text);
    await tester.tap(finder);

    expect(finder, findsOneWidget);
    expect(value, equals(true));
  });
}

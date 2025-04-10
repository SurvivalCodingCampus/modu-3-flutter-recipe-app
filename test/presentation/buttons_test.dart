import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentaiton/component/buttons.dart';

void main() {
  testWidgets('버튼 콜백 확인', (WidgetTester tester) async {
    bool bigClicked = false;
    bool mediumClicked = false;
    bool smallClicked = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            BigButtonsWidget(
              onClick: () {
                bigClicked = true;
              },
              buttons: const Buttons(name: 'Big'),
            ),
            MediumButtonsWidget(
              onClick: () {
                mediumClicked = true;
              },
              buttons: const Buttons(name: 'Medium'),
            ),
            SmallButtonsWidget(
              onClick: () {
                smallClicked = true;
              },
              buttons: const Buttons(name: 'Small'),
            ),
          ],
        ),
      ),
    );

    await tester.tap(find.text('Big'));
    expect(bigClicked, isTrue);

    await tester.tap(find.text('Medium'));
    expect(mediumClicked, isTrue);

    await tester.tap(find.text('Small'));
    expect(smallClicked, isTrue);
  });
}

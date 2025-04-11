import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/utils/app_show_dialog.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';

void main() {
  testWidgets('dialog test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return AppButton(
                text: 'dialog',
                onClick: () {
                  AppShowDialog.ratingDialog(context);
                },
              );
            },
          ),
        ),
      ),
    );
    final finder = find.text('dialog');
    await tester.tap(finder);

    // 다이얼로그 애니메이션 등 UI 변경 반영
    await tester.pumpAndSettle();

    // 다이얼로그 안의 텍스트가 있는지 확인
    expect(find.text('Rate recipe'), findsOneWidget);
    expect(find.text('Send'), findsOneWidget);
  });
}

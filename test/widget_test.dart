import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/score_dialog.dart';

void main() {
  testWidgets('ScoreDialog UI and interaction test', (WidgetTester tester) async {
    int? selectedScore;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScoreDialog(
            title: 'Rate recipe',
            actionName: 'Send',
            onChange: (score) {
              selectedScore = score;
            },
          ),
        ),
      ),
    );

    // 제목이 보이는지
    expect(find.text('Rate recipe'), findsOneWidget);

    // 별 5개가 보이는지 (IconButton이 5개)
    expect(find.byIcon(Icons.star), findsNWidgets(5));

    // 초기 상태에서는 Send 버튼이 비활성화 (회색 배경)
    final sendButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final buttonStyle = sendButton.style!;
    final backgroundColor = buttonStyle.backgroundColor?.resolve({}) ?? Colors.transparent;
    expect(backgroundColor, const Color(0xFFBDBDBD)); // 회색

    // 별 하나 누르기 (별 인덱스 2를 클릭하면 3점이 됨)
    await tester.tap(find.byIcon(Icons.star).at(2));
    await tester.pump();

    // 버튼이 활성화 되었는지 (노란색 배경)
    final updatedSendButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    final updatedColor = updatedSendButton.style?.backgroundColor?.resolve({}) ?? Colors.transparent;
    expect(updatedColor, Colors.amber);

    // 버튼 누르기
    await tester.tap(find.text('Send'));
    await tester.pumpAndSettle();

    // 콜백이 정상적으로 호출되었는지
    expect(selectedScore, 3);
  });
}
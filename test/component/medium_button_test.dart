import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';

void main() {
  testWidgets('Medium Button 테스트', (tester) async {
    final btnName = '미디움 버튼';
    int tapCount = 0;
    final mediumBtn = MediumButton(text: btnName);

    // 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(home: mediumBtn));

    // btnName으로 생성된 BigButton이 존재하는지 확인.
    expect(find.text(btnName), findsOneWidget);

    // BigButton을 탭합니다.
    await tester.tap(find.byType(MediumButton));
    await tester.pump();

    expect(tapCount, 1); // 버튼이 제대로 눌렸다면 tapCount는 1이 되어야 한다.
  });
}

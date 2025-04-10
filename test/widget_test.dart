import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/component/big_buttons.dart'; // 너의 경로에 맞게 수정

void main() {
  testWidgets('1. Big 버튼 클릭 시 print 출력되는지 테스트', (WidgetTester tester) async {
    final printLogs = <String>[];

    await runZonedGuarded(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BigButton(),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(
        printLogs.contains('Big 버튼 클릭됨!'),
        isTrue,
        reason: 'Big 버튼 클릭 시 print가 호출되어야 합니다.',
      );
    }, (e, s) {},
      zoneSpecification: ZoneSpecification(
        print: (_, __, ___, String msg) {
          printLogs.add(msg); // print 메시지 수집
        },
      ));
  });
}
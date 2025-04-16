import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    HttpOverrides.global = _TestHttpOverrides();
  });
  testWidgets('Recipe Card 테스트', (tester) async {
    final recipe = const Recipe(
      id: "1",
      name: "Traditional spare ribs baked",
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/2234/134e/6e53ef9148ab9085bbd1369e270f0bba?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=MFmWJPcr~S4mh9WZtwWrqEqi2iaItszN9hde5ATAClpO9HPQFOZ1YQBXCWRQtdVR-SgDPhiXai7Et3yr~cs3A2hpQw6mkApsxCgBCXROKw7sobH0tPMy5ugzYnTZm-8KuSt9OCbRtbuRnxBk3167G-bW5GyLdD0CThkHAuSvsaJFqwWSiNXc7L41KCo~E5ggWwruRP8VlGYo8DFjHHGveknq0raaVJvKvIDPbobibULGUxTlZi7KmQoyn3-i4Ffm6WksF9RarsiENZbx60cQ2resR2R1iogEqEnFNVeHCmKftkhMdlXzgN9xzMREmWaE7M14hKG6n4EIwpO1javB5A__',
      chef: 'By Chef John',
      totalTimeMinutes: '20',
      rating: 4.0,
      category: 'Chinese',
    );

    // 위젯을 빌드합니다.
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: RecipeCard(recipe: recipe))),
    );

    await tester.pumpAndSettle(); // 👈 이미지 등 모든 비동기 작업 대기
    // Recipe Card가 존재하는지 확인.
    expect(find.text('Traditional spare ribs baked'), findsOneWidget);
    expect(find.text('By Chef John'), findsOneWidget);
    expect(find.text('20 min'), findsOneWidget);
  });
}

class _TestHttpOverrides extends HttpOverrides {}

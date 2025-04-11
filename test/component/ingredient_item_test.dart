import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    HttpOverrides.global = _TestHttpOverrides();
  });
  testWidgets('Ingredient Item 테스트', (tester) async {
    final ingredientName = 'Tomato';
    final imageUrl =
        "https://s3-alpha-sig.figma.com/img/3c30/4e61/3dd3e1dd1f7360a6ef1c04399b0609ab?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Z1o~faIwyt6-juKGeztJ2D8GDEM66ccRS8CMg0e4-Ldw9tXRosaROZFDCQrLROVxG9RuaxwLP5ZjfgM7fRROYE4OVoiEQWdPjxN~9cWWWzFiG79eK-ZeDreGZBlJ39ps1vi~gaImP6HY83~-MVt7rBouxK2LvI9y2T-dnIbJzpO3FKVDyL~BQ328ez6-5Ef40tsgLqIlb3JCcClbRpDU5sh0fd4YhRTM88ELeC1brmBVIwJukIy85zZWy88zprw78~fpQ8eu9uPHFDq8j677ng4J7fO942x19hUwK9zgxiQe9R2EDS60ZOTydWh12UYGDq6MiAz~tDjcYV0mEUQm9Q__";
    final ingredient = Ingredient(
      id: "1",
      name: ingredientName,
      imageUrl: imageUrl,
      weight: 500,
    );
    final ingredientItem = IngredientItem(ingredient: ingredient);
    // 위젯을 빌드합니다.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: ingredientItem)));

    await tester.pumpAndSettle(); // 👈 이미지 등 모든 비동기 작업 대기
    // Ingredient Item이 존재하는지 확인.
    expect(find.text(ingredientName), findsOneWidget);
    expect(find.text('500g'), findsOneWidget);
  });
}

class _TestHttpOverrides extends HttpOverrides {}

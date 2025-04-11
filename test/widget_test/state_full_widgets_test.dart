import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/media.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/data/util/time_enum.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';

void main() {
  group('컴포넌트 테스트', () {
    testWidgets('IngredientItem 테스트', (widgetTester) async {
      // 1. 테스트용 데이터 생성
      final ingredient = const Ingredient(
        name: '당근',
        weight: 120,
        imageUrl:
            'assets/images/carrot.png', // 실제 asset 없어도 됨 (Image widget만 확인할 거니까)
      );

      // 2. IngredientItem 위젯 렌더링
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: IngredientItem(ingredient: ingredient)),
        ),
      );

      // 3. 텍스트가 제대로 표시되는지 확인
      expect(find.text('당근'), findsOneWidget);
      expect(find.text('120g'), findsOneWidget);

      // 4. 이미지 위젯이 존재하는지 확인 (asset path는 실제 asset 없어도 테스트 가능)
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('RecipeCard 테스트', (widgetTester) async {
      // 1. 테스트용 더미 Recipe 데이터 생성
      final recipe = const Recipe(
        title: '불고기',
        cookingTime: '30분',
        rate: 4.5,
        user: User(name: '요리왕비룡'),
        media: Media(imageUrl: 'assets/images/recipe4.png'),
      );

      // 2. 위젯 빌드
      await widgetTester.pumpWidget(
        MaterialApp(home: Scaffold(body: RecipeCard(recipe: recipe))),
      );

      // 3. 각 텍스트 요소가 표시되는지 확인
      expect(find.text('불고기'), findsOneWidget);
      expect(find.text('By 요리왕비룡'), findsOneWidget);
      expect(find.text('30분'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);

      // 4. 이미지가 표시되는 위젯 확인 (Image.asset)
      expect(find.byType(Image), findsNWidgets(2)); // 시계 아이콘, 북마크 아이콘

      // 5. 별 아이콘 표시 확인
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('FilterButton 테스트', (widgetTester) async {
      bool tapped = false;

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterButton(
              value: Time.newest,
              color: Colors.green,
              ontap: () => tapped = true,
            ),
          ),
        ),
      );

      // 텍스트가 올바르게 표시되는지
      expect(find.text('newest'), findsOneWidget);

      // 처음에는 비선택 상태 (흰 배경)
      final container = widgetTester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.white));

      // 탭을 시도하면 onTap 콜백이 호출되고 색상 변경됨
      await widgetTester.tap(find.byType(FilterButton));
      await widgetTester.pump(); // 상태 업데이트 반영

      expect(tapped, isTrue);

      // 상태 변경 후 배경색이 바뀌는지 확인
      final containerAfter = widgetTester.widget<Container>(
        find.byType(Container).first,
      );
      final decorationAfter = containerAfter.decoration as BoxDecoration;
      expect(decorationAfter.color, equals(Colors.green));
    });

    testWidgets('RatingButton 테스트', (widgetTester) async {
      bool tapped = false;

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingButton(
              rate: '4',
              color: Colors.blue,
              ontap: () => tapped = true,
            ),
          ),
        ),
      );

      // rate 텍스트가 보이는지
      expect(find.text('4'), findsOneWidget);

      // 별 아이콘이 보이는지
      expect(find.byIcon(Icons.star), findsOneWidget);

      // 초기에 배경색은 흰색이어야 함
      final container = widgetTester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.white));

      // 탭 시 onTap 호출되고 색상 바뀜
      await widgetTester.tap(find.byType(RatingButton));
      await widgetTester.pump();

      expect(tapped, isTrue);

      final containerAfter = widgetTester.widget<Container>(
        find.byType(Container).first,
      );
      final decorationAfter = containerAfter.decoration as BoxDecoration;
      expect(decorationAfter.color, equals(Colors.blue));
    });

    testWidgets('RatingDialog 테스트', (widgetTester) async {
      int changedValue = 0;

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RatingDialog(
              title: '평가해주세요',
              actionName: '등록',
              onChange: (val) => changedValue = val,
            ),
          ),
        ),
      );

      // 세 번째 별을 탭
      final thirdStar = find.byIcon(Icons.star_border).at(2);
      await widgetTester.tap(thirdStar);
      await widgetTester.pump(); // 상태 업데이트 반영

      expect(changedValue, equals(3));
    });
  });
}

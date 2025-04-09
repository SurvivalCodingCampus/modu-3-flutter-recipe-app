import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/2025-04-09/presentation/component/big_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/medium_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/small_button.dart';
import 'package:recipe_app/main.dart';

void main() {
  testWidgets('Widget Buttons Test', (WidgetTester tester) async {
    final bigButton = BigButton(
      onClick: () {
        print('빅 버튼');
      },
    );
    final mediumButton = MediumButton(
      onClick: () {
        print('미디움 버튼');
      },
    );
    final smallButton = SmallButton(
      onClick: () {
        print('스몰 버튼');
      },
    );
    await tester.pumpWidget(MyApp());
    //BigButton이라는 타입의 위젯이 있는지 확인
    expect(find.byType(BigButton), findsOneWidget);
    expect(find.byType(MediumButton), findsOneWidget);
    expect(find.byType(SmallButton), findsOneWidget);
  });
  testWidgets('Widget Label Test', (WidgetTester tester) async {
    final bigButton = BigButton(
      onClick: () {
        print('빅 버튼');
      },
    );
    final mediumButton = MediumButton(
      onClick: () {
        print('미디움 버튼');
      },
    );
    final smallButton = SmallButton(
      onClick: () {
        print('스몰 버튼');
      },
    );
    await tester.pumpWidget(MyApp());
    //BigButton이라는 타입의 위젯이 있는지 확인
    expect(find.byType(BigButton), findsOneWidget);
    expect(find.byType(MediumButton), findsOneWidget);
    expect(find.byType(SmallButton), findsOneWidget);
  });
}

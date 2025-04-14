import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/recipe_app/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';
import 'package:recipe_app/recipe_app/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/repository/recipe_repository_impl.dart';

void main() {
  MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
  RecipeRepository repository = RecipeRepositoryImpl(
    recipeDataSource: mockRecipeDataImpl,
  );
  testWidgets('SplashScreen Check Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: SplashScreen(repository: repository))),
    );
    //스플래시 화면이 표시되는지 확인
    expect(find.byType(SplashScreen), findsOneWidget);
    // 버튼을 찾아 탭하기 (버튼의 Key나 텍스트, 또는 위젯 타입으로 찾을 수 있음)
    final button = find.byType(ElevatedButton); // 버튼 타입에 맞게 수정하세요
    expect(button, findsOneWidget);
    await tester.tap(button);

    // 화면 전환 애니메이션 대기
    await tester.pumpAndSettle();

    // Splash Screen이 더이상 안보이는지 확인
    expect(find.byType(SplashScreen), findsNothing);
  });
}

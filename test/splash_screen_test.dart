import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/recipe_app/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/presentation/home/splash_screen.dart';
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
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}

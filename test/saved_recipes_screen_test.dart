import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen_root.dart';

void main() {
  diSetUp();
  testWidgets('SavedRecipesScreen Check Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: SavedRecipesScreenRoot(viewModel: getIt())),
      ),
    );
    expect(find.byType(SavedRecipesScreen), findsOneWidget);
  });
}

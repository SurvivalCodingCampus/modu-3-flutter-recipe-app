import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/media.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';

void main() {
  group('RecipeCard Widget Test', () {
    testWidgets('RecipeCard', (WidgetTester tester) async {
      Recipe recipe = Recipe(
        title: "Spice roasted chicken with flavored rice",
        ingredient: [
          Ingredient(imageUrl: 'imageUrl', name: 'name', weight: 20),
        ],
        time: 20,
        rating: 4.0,
        user: User(name: "Mark Kelvin"),
        media: Media(
          imageId: 'imageId',
          thunbNailUrl: 'assets/images/tomatos.png',
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
      );

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: RecipeCard(recipe: recipe))),
      );

      expect(
        find.text("Spice roasted chicken with flavored rice"),
        findsOneWidget,
      );
      expect(find.text('By Mark Kelvin'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}

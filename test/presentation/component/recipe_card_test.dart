import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/ingredient/ingredient.dart';
import 'package:recipe_app/domain/model/media/media.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/core/component/recipe_card.dart';

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

        category: Category.breakfast,

        recipeId: 1,
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl: 'assets/images/tomatos.png',
      );

      // await tester.pumpWidget(
      //   MaterialApp(home: Scaffold(body: RecipeCard(recipe: recipe))),
      // );

      expect(
        find.text("Spice roasted chicken with flavored rice"),
        findsOneWidget,
      );
      expect(find.text('By Mark Kelvin'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}

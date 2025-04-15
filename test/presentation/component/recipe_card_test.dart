import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/model/filter/filter_enum.dart';
import 'package:recipe_app/data/model/ingredient/ingredient.dart';
import 'package:recipe_app/data/model/media/media.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/data/model/user/user.dart';
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
        user: User(
          name: "Mark Kelvin",
          id: 1,
          userId: 'user1',
          email: 'user1@email.com',
          address: '',
        ),
        category: Category.breakfast,
        media: Media(
          imageId: 'imageId',
          thumbNailUrl: 'assets/images/tomatos.png',
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
        recipeId: 1,
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl: 'assets/images/tomatos.png',
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

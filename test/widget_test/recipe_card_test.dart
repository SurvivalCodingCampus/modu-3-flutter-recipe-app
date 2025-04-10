import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';

void main() {
  testWidgets('recipe card test', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                child: RecipeCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
                  rating: '4.5',
                  time: '10 min',
                  title: 'Spicy Nelly',
                ),
              ),
            ),
          ),
        ),
      );
      expect(find.text('Spicy Nelly'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('10 min'), findsOneWidget);

      final bookmarkIcon = find.byIcon(Icons.bookmark);
      expect(bookmarkIcon, findsOneWidget);
      await tester.tap(bookmarkIcon);
      await tester.pump();
      final bookmarkedIcon = find.byIcon(Icons.bookmark_border_outlined);
      expect(bookmarkedIcon, findsOneWidget);
    });
  });
}

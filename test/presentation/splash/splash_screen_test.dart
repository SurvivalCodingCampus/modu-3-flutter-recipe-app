import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

void main() {
  testWidgets('Splash Screen 테스트', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: SplashScreen(),
        ),
      );
    });

    final Finder title = find.text('Get\nCooking');
    final Finder subTitle = find.text('Simple way to find Tasty Recipe');
    final Finder button = find.byType(ButtonWidget);

    expect(title, findsOneWidget);
    expect(subTitle, findsOneWidget);
    expect(button, findsOneWidget);
  });
}

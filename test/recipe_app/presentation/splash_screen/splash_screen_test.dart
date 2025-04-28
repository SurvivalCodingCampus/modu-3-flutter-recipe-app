import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';

void main() {
  diSetUp();
  testWidgets('SplashScreen GoRouter Test', (WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => SplashScreen(viewModel: getIt()),
        ),
        GoRoute(
          path: Routes.signIn,
          builder: (context, state) => const Scaffold(body: SignInScreen()),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    expect(find.byType(SplashScreen), findsOneWidget);

    final button = find.byType(ElevatedButton);
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsNothing);
    expect(find.byType(SignInScreen), findsOneWidget);
  });
}

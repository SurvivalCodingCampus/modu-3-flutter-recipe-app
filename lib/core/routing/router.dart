import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/presentation/main/home/home_screen.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_detail_view.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/core/routing/routes.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(getIt()),
    ),

    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => const SignInScreen(),
    ),

    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),

    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchRecipesScreen(viewModel: getIt()),
    ),

    GoRoute(
      path: '${Routes.savedDetail}:id',

      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');
        return SavedRecipesDetailView(recipeId: id!);
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              navigationShell.goBranch(index);
            },
            selectedIndex: navigationShell.currentIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.bookmark), label: 'Saved'),
              NavigationDestination(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.saved,
              builder:
                  (context, state) =>
                      SavedRecipesScreen(savedRecipesViewModel: getIt()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notification,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

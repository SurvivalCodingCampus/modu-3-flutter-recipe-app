import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';

import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_view_model.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/saved-recipes',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              navigationShell.goBranch(index);
            },
            indicatorColor: Colors.amber,
            selectedIndex: navigationShell.currentIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.notifications_sharp)),
                label: 'Notifications',
              ),
            ],
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder:
                  (context, state) => HomeScreen(
                    viewModel: HomeViewModel(MockRecipeRepositoryImpl()),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved-recipes',
              builder:
                  (context, state) =>
                      SearchRecipesScreen(viewModel: SearchRecipesViewModel()),
            ),
          ],
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/data/repository/mock_user_repository_impl.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';

import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_view_model.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';

// 싱글턴
final _userRepository = MockUserRepositoryImpl();

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
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
              builder: (context, state) {
                return HomeScreen(
                  viewModel: HomeViewModel(
                    getSavedRecipesUseCase: GetSavedRecipesUseCase(
                      userRepository: _userRepository,
                      recipeRepository: MockRecipeRepositoryImpl(),
                    ),
                    userRepository: _userRepository,
                  ),
                );
              },
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

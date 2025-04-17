import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/pages/error_screen.dart';
import 'package:recipe_app/core/presentation/pages/root_tab.dart';
import 'package:recipe_app/feature/auth/presentation/pages/sign_up_screen.dart';
import 'package:recipe_app/feature/auth/presentation/pages/sing_in_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_screen.dart';
import 'package:recipe_app/feature/notification/presentation/pages/notification_screen.dart';
import 'package:recipe_app/feature/profile/presentation/pages/profile_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_screen.dart';
import 'package:recipe_app/core/presentation/pages/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  routes: routes,
);

final routes = [
  GoRoute(
    path: AppRoutes.splash,
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signIn,
    builder: (context, state) {
      return const SingInScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signUp,
    builder: (context, state) {
      return const SingUpScreen();
    },
  ),

  GoRoute(
    path: AppRoutes.search,
    builder: (context, state) {
      return const SearchScreen();
    },
  ),

  GoRoute(
    path: AppRoutes.info,
    name: 'info',
    builder: (context, state) {
      final id = state.pathParameters['id'];
      if (id == null) {
        return const ErrorScreen();
      }
      return RecipeInfoScreen(id: int.parse(id));
    },
  ),

  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) {
      return RootTab(child: child);
    },
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.savedRecipes,
        builder: (context, state) {
          return const SavedRecipesScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.notification,
        builder: (context, state) {
          return const NotificationScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.profle,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
    ],
  ),

  GoRoute(
    path: AppRoutes.error,
    builder: (context, state) {
      return const ErrorScreen();
    },
  ),
];

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static const String root = '/root';
  static const String home = '/home';
  static const String savedRecipes = '/saved-recipes';
  static const String notification = '/notification';
  static const String profle = '/profile';
  static const String info = '/info/:id';

  static const String error = 'error';

  static const String search = '/search';
}

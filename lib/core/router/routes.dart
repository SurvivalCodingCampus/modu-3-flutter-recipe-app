import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/pages/auth/sign_up_screen.dart';
import 'package:recipe_app/presentation/pages/auth/sing_in_screen.dart';
import 'package:recipe_app/presentation/pages/main/notification/notification_screen.dart';
import 'package:recipe_app/presentation/pages/main/profile/profile_screen.dart';
import 'package:recipe_app/presentation/pages/main/root_tab.dart';
import 'package:recipe_app/presentation/pages/main/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/search/screen/search_screen.dart';
import 'package:recipe_app/presentation/pages/splash/splash_screen.dart';

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

  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) {
      return RootTab(child: child);
    },
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) {
          return const SavedRecipesScreen();
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

  static const String search = '/search';
}

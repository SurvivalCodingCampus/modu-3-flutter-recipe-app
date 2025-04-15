import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/presentation/ingredient/sign/sign_up_screen.dart';
import 'package:recipe_app/presentation/main/home/home_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.signIn, builder: (context, state) => SignUpScreen()),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => HomeScreen()
            )
          ]
        ),
        StatefulShellBranch(
            routes: [
              GoRoute(
                  path: Routes.home,
                  builder: (context, state) => HomeScreen()
              )
            ]
        ),
        StatefulShellBranch(
            routes: [
              GoRoute(
                  path: Routes.home,
                  builder: (context, state) => HomeScreen()
              )
            ]
        ),
        StatefulShellBranch(
            routes: [
              GoRoute(
                  path: Routes.home,
                  builder: (context, state) => HomeScreen()
              )
            ]
        )
      ],
    ),
  ],
);

class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey<String>('MainScreen'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined)),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({Key? key, required this.child})
      : super(key: key ?? const ValueKey<String>('MainScreen'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorStyles.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorStyles.primary100,
        unselectedItemColor: ColorStyles.gray4,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border, size: 30),
            label: 'bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined, size: 30),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, size: 30),
            label: 'profile',
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.savedRecipes)) return 1;
    if (location.startsWith(Routes.notifications)) return 2;
    if (location.startsWith(Routes.profile)) return 3;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.savedRecipes);
        break;
      case 2:
        context.go(Routes.notifications);
        break;
      case 3:
        context.go(Routes.profile);
        break;
    }
  }
}
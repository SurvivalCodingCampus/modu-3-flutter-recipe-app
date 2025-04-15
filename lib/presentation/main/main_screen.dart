import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/routes.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (value) {
          switch (value) {
            case 0:
              context.go(Routes.home);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ColorStyle.gray4),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: ColorStyle.gray4),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: ColorStyle.gray4),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: ColorStyle.gray4),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final location = GoRouterState.of(context).uri.toString();
  if (location.startsWith('/saved')) return 1;
  if (location.startsWith('/notification')) return 2;
  if (location.startsWith('/profile')) return 3;
  return 0;
}

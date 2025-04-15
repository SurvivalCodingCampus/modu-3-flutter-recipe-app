import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/ui/color_style.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  final Widget child;
  const BottomNavigationBarScreen({super.key, required this.child});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;

  void changeTab(int index) {
    if (currentIndex == index) {
      return;
    }
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.savedRecipes);
        break;
      default:
        context.go(Routes.splash);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        backgroundColor: ColorStyles.white,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_filled,
              color: ColorStyles.primary100,
              size: 36,
            ),
            icon: Icon(Icons.home_filled, color: ColorStyles.gray4, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.bookmark_border,
              color: ColorStyles.primary100,
              size: 36,
            ),
            icon: Icon(
              Icons.bookmark_border,
              color: ColorStyles.gray4,
              size: 24,
            ),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_filled,
              color: ColorStyles.primary100,
              size: 36,
            ),
            icon: Icon(Icons.home_filled, color: ColorStyles.gray4, size: 24),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_filled,
              color: ColorStyles.primary100,
              size: 36,
            ),
            icon: Icon(Icons.home_filled, color: ColorStyles.gray4, size: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

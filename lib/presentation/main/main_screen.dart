import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('MainScreen'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorStyles.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorStyles.primary100,
        unselectedItemColor: ColorStyles.gray4,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              size: 30,
            ),
            label: 'bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: 30,
            ),
            label: 'profile',
          ),
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
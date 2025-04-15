import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;
  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff6C6C6C).withValues(alpha: 0.08), // 그림자 색상
              blurRadius: 8, // 퍼짐 정도
              offset: const Offset(0, 0), // 위쪽 그림자 (Y 음수)
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          onDestinationSelected: onChangeIndex,
          selectedIndex: currentPageIndex,
          destinations: [
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/home.png',
                color: ColorStyles.gray4,
              ),
              label: "home",
              selectedIcon: Image.asset('assets/icons/home.png'),
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/bookmark.png',
                color: ColorStyles.gray4,
              ),
              label: "bookmark",
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/icons/bookmark_fill.png',
                    color: ColorStyles.primary40,
                  ),
                  Image.asset(
                    'assets/icons/bookmark.png',
                    color: ColorStyles.primary100,
                  ),
                ],
              ),
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/notification.png',
                color: ColorStyles.gray4,
              ),
              label: "notifications",
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/icons/notification_fill.png',
                    color: ColorStyles.primary40,
                  ),
                  Image.asset(
                    'assets/icons/notification.png',
                    color: ColorStyles.primary100,
                  ),
                ],
              ),
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/my.png',
                color: ColorStyles.gray4,
              ),
              label: "profile",
              selectedIcon: Stack(
                children: [
                  Image.asset(
                    'assets/icons/my_fill.png',
                    color: ColorStyles.primary40,
                  ),
                  Image.asset(
                    'assets/icons/my.png',
                    color: ColorStyles.primary100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

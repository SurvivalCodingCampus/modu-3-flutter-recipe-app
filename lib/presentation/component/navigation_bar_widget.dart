import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationBarWidget({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: Container(
        height: 106,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        color: Colors.white,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                navigationShell.goBranch(0);
              },
              child: Image.asset(
                'assets/icons/home.png',
                width: 24,
                height: 24,
                color: navigationShell.currentIndex == 0 ? null : Colors.grey,
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {
                navigationShell.goBranch(1);
              },
              child: Image.asset(
                'assets/icons/bookmark.png',
                width: 24,
                height: 24,
                color: navigationShell.currentIndex == 1 ? null : Colors.grey,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                navigationShell.goBranch(2);
              },
              child: Image.asset(
                'assets/icons/bing.png',
                width: 24,
                height: 24,
                color: navigationShell.currentIndex == 2 ? null : Colors.grey,
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {
                navigationShell.goBranch(3);
              },
              child: Image.asset(
                'assets/icons/profile.png',
                width: 24,
                height: 24,
                color: navigationShell.currentIndex == 3 ? null : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

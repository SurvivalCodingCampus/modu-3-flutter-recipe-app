import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell body;
  final int currentPageIndex;
  final void Function(int value) onChangeIndex;
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorStyle.primary100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, size: 24, color: ColorStyle.white),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorStyle.white,
        onDestinationSelected: onChangeIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: Image.asset('assets/images/home-2.png'),
            label: 'home',
            selectedIcon: Stack(
              children: [
                Image.asset(
                  'assets/images/home-2-1.png',
                  color: ColorStyle.primary100.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
          NavigationDestination(
            icon: Image.asset('assets/images/Inactive.png'),
            label: 'home',
            selectedIcon: Stack(
              children: [
                Image.asset(
                  'assets/images/Active.png',
                  color: ColorStyle.primary100.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
          NavigationDestination(
            icon: Image.asset('assets/images/notification-bing.png'),
            label: 'home',
            selectedIcon: Stack(
              children: [
                Image.asset(
                  'assets/images/notification-bing.png',
                  color: ColorStyle.primary100.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
          NavigationDestination(
            icon: Image.asset('assets/images/profile.png'),
            label: 'home',
            selectedIcon: Stack(
              children: [
                Image.asset(
                  'assets/images/frame.png',
                  color: ColorStyle.primary100.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

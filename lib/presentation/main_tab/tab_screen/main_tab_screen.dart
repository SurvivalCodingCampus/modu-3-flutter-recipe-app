import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_action.dart';

class MainTabScreen extends StatelessWidget {
  final void Function(MainTabAction action) onAction;
  final StatefulNavigationShell navigationShell;

  const MainTabScreen({
    super.key,
    required this.onAction,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _MainBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          onAction(MainTabAction.onTapTab(index));
          navigationShell.goBranch(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAction(const MainTabAction.onTapFAB()),
        backgroundColor: ColorStyle.primary100,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: ColorStyle.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _MainBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorStyle.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(0, 'tab_home'),
          _buildIcon(1, 'tab_bookmark'),
          const SizedBox(width: 48),
          _buildIcon(3, 'tab_notification'),
          _buildIcon(4, 'tab_profile'),
        ],
      ),
    );
  }

  Widget _buildIcon(int index, String name) {
    final isSelected = currentIndex == index;
    print('currentIndex($currentIndex) isSelected: $isSelected');
    final imageName = isSelected ? '${name}_active' : name;
    final path = 'assets/images/icons/$imageName.png';

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(width: 28, height: 28, child: AppImage(path: path)),
      ),
    );
  }
}

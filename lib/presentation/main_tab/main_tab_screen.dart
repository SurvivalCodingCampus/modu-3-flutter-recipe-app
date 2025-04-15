import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/presentation/main_tab/main_bottom_nav_bar.dart';

class MainTabScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainTabScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigationShell.goBranch(2),
        backgroundColor: ColorStyle.primary100,
        elevation: 6,
        shape: const CircleBorder(), // ✅ 명시적으로 원형
        child: const Icon(
          Icons.add,
          color: ColorStyle.white,
          size: 28, // 적당한 크기
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

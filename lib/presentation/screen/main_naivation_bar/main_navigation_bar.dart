import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';

class MainNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationBar({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell, // 선택된 탭의 내용
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          CustomCurvedNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: _onTap,
          ),
          Positioned(
            top: -20,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: ColorStyle.primary100,
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                onTap: () {
                  print('Floating Action Button Pressed!');
                },
                child: const Icon(Icons.add, size: 32, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCurvedNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomCurvedNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyle.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // 그림자 색상 (투명도 포함)
            blurRadius: 10, // 그림자의 블러 정도
            offset: Offset(0, -5), // 그림자의 위치 (x, y)
          ),
        ],
      ),
      child: CustomPaint(
        child: SizedBox(
          height: 106,

          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(
                  'assets/images/icons/home_1.png', // 비선택 상태
                  'assets/images/icons/home_2.png', // 선택 상태
                  0,
                ),
                _buildNavItem(
                  'assets/images/icons/save_1.png',
                  'assets/images/icons/save_2.png',
                  1,
                ),
                const SizedBox(width: 40), // 중앙 여백
                _buildNavItem(
                  'assets/images/icons/notification_1.png',
                  'assets/images/icons/notification_2.png',
                  2,
                ),
                _buildNavItem(
                  'assets/images/icons/profile_1.png',
                  'assets/images/icons/profile_2.png',
                  3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String imagePath, String selectedImagePath, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Image.asset(
        isSelected ? selectedImagePath : imagePath,
        width: 24,
        height: 24,
      ),
    );
  }
}

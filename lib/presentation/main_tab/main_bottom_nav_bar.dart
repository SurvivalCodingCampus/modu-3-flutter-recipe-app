import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

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
          const SizedBox(width: 48), // 중앙 공간
          _buildIcon(3, 'tab_notification'),
          _buildIcon(4, 'tab_profile'),
        ],
      ),
    );
  }

  Widget _buildIcon(int index, String name) {
    final isSelected = currentIndex == index;
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

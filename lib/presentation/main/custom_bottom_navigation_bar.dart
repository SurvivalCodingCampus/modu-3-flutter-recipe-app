
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell shell;

  const CustomBottomNavigationBar({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      elevation: 0,
      //color: Colors.white.withOpacity(0), 투명하게 하려 했는데 필요 없음.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavigationItem(Icons.home, NavigationItemType.home),
          _buildNavigationItem(Icons.bookmark, NavigationItemType.bookmark),
          const SizedBox(width: 40), // FAB 양옆 간격 보기 좋게 설정
          _buildNavigationItem(Icons.notifications, NavigationItemType.notifications),
          _buildNavigationItem(Icons.person, NavigationItemType.profile),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(IconData icon, NavigationItemType type) {
    final index = NavigationItemType.values.indexOf(type);
    final isSelected = shell.currentIndex == index;
    return IconButton(
      icon: Icon(icon, color: isSelected ? Colors.green : Colors.grey),
      onPressed: () => shell.goBranch(index),
    );
  }
}

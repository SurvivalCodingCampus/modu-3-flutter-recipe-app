import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/router/routes.dart';
import 'package:recipe_app/core/style/app_color.dart';

class RootTab extends StatefulWidget {
  final Widget child;
  const RootTab({required this.child, super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      isSafeArea: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedItemColor: AppColor.grey4,
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primary100,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      child: widget.child,
    );
  }

  void onTap(int index) {
    switch (index) {
      case 0:
        context.replace(AppRoutes.home);
        break;
      case 1:
        context.replace(AppRoutes.savedRecipes);
        break;
      case 2:
        context.replace(AppRoutes.notification);
        break;
      default:
        context.replace(AppRoutes.profle);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}

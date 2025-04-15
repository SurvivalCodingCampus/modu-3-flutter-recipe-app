import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/router/routes.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: AppColor.primary100),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline, color: AppColor.primary100),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColor.primary100,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: AppColor.primary100),
          ),
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
        context.replace(AppRoutes.savedRecipes);
        break;
      default:
        context.replace(AppRoutes.savedRecipes);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}

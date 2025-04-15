import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';

class BottomNavigationBarScaffold extends StatefulWidget {
  final Widget child;

  const BottomNavigationBarScaffold({super.key, required this.child});

  @override
  State<BottomNavigationBarScaffold> createState() =>
      _BottomNavigationBarScaffoldState();
}

class _BottomNavigationBarScaffoldState
    extends State<BottomNavigationBarScaffold> {
  int currentIndex = 0;

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go(Routes.homeScreen);
        break;
      case 1:
        context.go(Routes.savedRecipes);
        break;
      case 2:
        context.go(Routes.notificationScreen);
        break;
      case 3:
        context.go(Routes.myPageScreen);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorStyles2.splashButtonColor,

        items: const [
          //label 속성 생략 불가능
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/routes.dart';
import '../../ui/color.dart';



class BottomNavigationBarScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationBarScaffold({super.key, required this.navigationShell});

  @override
  State<BottomNavigationBarScaffold> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNavigationBarScaffold> {
  int naviIndex = 0;

  void changeTab(int index) {
    switch(index) {
      case 0:
        context.go(Routes.home);
      case 1:
        context.go(Routes.saved);
      case 2:
        context.go(Routes.search);
      default:
        break;
    }
    setState(() {
      naviIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changeTab(index);
        },
        iconSize: 24,
        backgroundColor: Colors.white,
        currentIndex: naviIndex,
        selectedItemColor: ColorStyles.primary100,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'saved'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        ]
      ),
    );
  }
}

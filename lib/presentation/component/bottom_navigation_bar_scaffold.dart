import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/ui/color_styles.dart';

class BottomNavigationBarScaffold extends StatefulWidget {
  final Widget child;
  final int pageIndex;

  const BottomNavigationBarScaffold({
    super.key,
    required this.child,
    this.pageIndex = 0,
  });
  @override
  State<StatefulWidget> createState() => _BottomNavigationBarScaffoldState();
}

class _BottomNavigationBarScaffoldState
    extends State<BottomNavigationBarScaffold> {
  late int pageIndex;

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.splash);
        break;
      default:
        context.go('/');
        break;
    }

    setState(() {
      pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    pageIndex = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            changeTab(index);
          });
        },
        backgroundColor: const Color.fromRGBO(108, 108, 108, 0.08),
        iconSize: 24,
        currentIndex: pageIndex,
        selectedItemColor: ColorStyles.primary100,
        unselectedItemColor: ColorStyles.gray4,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.doorbell), label: 'bell'),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_sharp),
            label: 'user',
          ),
        ],
      ),
    );
  }
}

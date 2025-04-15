import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../component/bottom_navigation_bar.dart';

class HomeTab extends StatefulWidget {
  final Widget child;
  const HomeTab({super.key, required this.child});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    Routes.home,
    Routes.savedRecipes,
    Routes.notification,
    Routes.profile,
  ];
  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: MadeNVBar(index: _selectedIndex, onTap: _onTap),
    );
  }
}

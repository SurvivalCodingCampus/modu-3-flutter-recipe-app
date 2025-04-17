import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';
import '../../../ui/text_styles.dart';
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
    String? getTitle() {
      if (_selectedIndex == 1) return 'Saved recipes';
      // if (_ return 'Notification';
      // if (widget.location == Routes.profile) return 'Profile';
      return null;
    }

    return Scaffold(
      appBar:
          getTitle() != null
              ? AppBar(
                title: Text(getTitle()!),
                centerTitle: true,
                titleTextStyle: TextStyles.mediumBold.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
              )
              : null,
      body: widget.child,
      bottomNavigationBar: MadeNVBar(index: _selectedIndex, onTap: _onTap),
    );
  }
}

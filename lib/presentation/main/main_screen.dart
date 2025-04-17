import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/routes.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  final Widget bottomNavigationBar;
  const MainScreen({
    super.key,
    required this.child,
    required this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child, bottomNavigationBar: bottomNavigationBar);
  }
}

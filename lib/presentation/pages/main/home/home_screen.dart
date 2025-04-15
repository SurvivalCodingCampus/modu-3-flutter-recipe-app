import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(child: Column(children: [Text('home')]));
  }
}

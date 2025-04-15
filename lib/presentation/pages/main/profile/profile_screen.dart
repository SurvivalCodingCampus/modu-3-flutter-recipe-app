import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(child: Column(children: [Text('profile')]));
  }
}

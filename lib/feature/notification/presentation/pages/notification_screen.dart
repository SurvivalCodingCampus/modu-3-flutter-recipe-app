import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(child: Column(children: [Text('notification')]));
  }
}

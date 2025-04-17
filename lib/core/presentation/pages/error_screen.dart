import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(child: Center(child: Text('에러 발생')));
  }
}

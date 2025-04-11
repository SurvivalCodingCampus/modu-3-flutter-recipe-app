import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final VoidCallback onComponentButton;
  final VoidCallback onSavedRecipeButton;
  const TestScreen({
    super.key,
    required this.onComponentButton,
    required this.onSavedRecipeButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onComponentButton,
              child: const Text('Components'),
            ),
            ElevatedButton(
              onPressed: onSavedRecipeButton,
              child: const Text('Saved Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  final VoidCallback onComponentButton;
  final VoidCallback onSavedRecipeButton;
  final VoidCallback onSearchRecipeButton;

  const TestScreen({
    super.key,
    required this.onComponentButton,
    required this.onSavedRecipeButton,
    required this.onSearchRecipeButton,
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
            ElevatedButton(
              onPressed: onSearchRecipeButton,
              child: const Text('Search Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}

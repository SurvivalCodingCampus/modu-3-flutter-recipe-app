import 'package:flutter/material.dart';

import 'home_action.dart';
import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;

  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      children:
          state.recipes.map((r) {
            return ListTile(
              title: Text(r.name),
              onTap: () => onAction(HomeAction.tapRecipe(r.id)),
            );
          }).toList(),
    );
  }
}

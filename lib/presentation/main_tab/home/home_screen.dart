import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

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

    return Column(
      children: [
        _buildHeader(context),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children:
                state.recipes.map((r) {
                  return ListTile(
                    title: Text(r.name),
                    onTap: () => onAction(HomeAction.tapRecipe(r.id)),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: InputField(
              labelTitle: '',
              placeholderText: 'Search recipe',
              value: '',
              height: 55,
              inputHorizontalPadding: 20,
              iconWidget: InputField.searchIcon(),
              onValueChange: null,
              onTap: () {
                FocusScope.of(context).unfocus();
                context.push(Routes.search);
              },
              readOnly: true,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}

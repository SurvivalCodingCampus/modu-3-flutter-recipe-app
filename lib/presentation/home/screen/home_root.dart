import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/presentation/home/screen/home_screen.dart';

class HomeRoot extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return HomeScreen(
          state: viewModel.state,
          onAction: (action) {
            if (action case OnSearchTap()) {
              context.push(Routes.searchRecipes);
            } else {
              viewModel.action(action);
            }
          },
          selectedCategory: viewModel.state.selectedCategory,
        );
      },
    );
  }
}

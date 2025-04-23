import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/main_tab/home/home_action.dart';

import 'home_screen.dart';
import 'home_view_model.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreenRoot({super.key, required this.viewModel});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final state = widget.viewModel.state;
        return HomeScreen(
          state: state,
          onAction: (action) async {
            switch (action) {
              case TapRecipe(:final recipeId):
                await context.push(Routes.recipeDetailPath(recipeId));
              case SearchTouch():
                await context.push(Routes.homeSearch);
                // widget.viewModel.load(); // 돌아왔을 때 다시 로딩
                break;
              default:
                widget.viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}

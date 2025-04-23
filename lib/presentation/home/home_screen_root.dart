import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

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
    widget.viewModel.loadRecipeAndUser();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return HomeScreen(
          state: widget.viewModel.state,
          onAction: (action) {
            switch (action) {
              case OnSearchTap():
                context.push(Routes.search);
                break;
              case OnSelectTap():
                widget.viewModel.onAction(HomeAction.onSelectTap(action.index));
                break;
              case OnRecipeTap(recipe: final recipe):
                print(recipe);
                break;
              case OnBookmarkTap():
                widget.viewModel.onAction(
                  HomeAction.onBookmarkTap(action.recipeId),
                );
            }
          },
        );
      },
    );
  }
}

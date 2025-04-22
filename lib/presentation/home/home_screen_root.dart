import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

import '../../core/routing/routes.dart';

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
    widget.viewModel.getAllCategories();
    widget.viewModel.fetchDishCardsByCategory(widget.viewModel.state.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, snapshot) {
            return HomeScreen(
              state: widget.viewModel.state,
              onAction: (action) {
                switch (action) {
                  case OnTapSearch():
                    context.push(Routes.search);
                  case OnTapCategory():
                    widget.viewModel.onTapCategory(action.category);
                  case OnTapRecipe():
                    widget.viewModel.onTapFavorite(action.recipe);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

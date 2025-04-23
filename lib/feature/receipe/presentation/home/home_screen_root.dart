import 'package:flutter/material.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_action.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_view_model.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeScreenRoot(this.viewModel, {super.key});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  void initState() {
    widget.viewModel.onAction(const HomeAction.getRecipes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (child, context) {
        return HomeScreen(
          state: widget.viewModel.state,
          onAction: widget.viewModel.onAction,
        );
      },
    );
  }
}

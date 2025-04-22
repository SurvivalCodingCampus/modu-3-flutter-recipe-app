import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/home/home_screen.dart';
import 'package:recipe_app/presentation/page/home/home_view_model.dart';

class HomeScreenRoot extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreenRoot({super.key, required this.viewModel, });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: viewModel, builder: (context, widget) {
      return HomeScreen(
        state: viewModel.state,
        onAction: viewModel.onAction,
      );
    });
  }
}

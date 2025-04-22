import 'package:flutter/material.dart';

import 'home_action.dart';
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
    widget.viewModel.onAction(const HomeAction.init());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.viewModel,
      builder:
          (context, _) => HomeScreen(
            state: widget.viewModel.state,
            onAction: widget.viewModel.onAction,
          ),
    );
  }
}

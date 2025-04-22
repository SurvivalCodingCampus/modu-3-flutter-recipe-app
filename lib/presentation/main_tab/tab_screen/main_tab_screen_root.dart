import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_screen.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_view_model.dart';

class MainTabScreenRoot extends StatefulWidget {
  final MainTabViewModel viewModel;
  final StatefulNavigationShell navigationShell;

  const MainTabScreenRoot({
    super.key,
    required this.navigationShell,
    required this.viewModel,
  });

  @override
  State<MainTabScreenRoot> createState() => _MainTabScreenRootState();
}

class _MainTabScreenRootState extends State<MainTabScreenRoot> {
  @override
  void initState() {
    super.initState();
    // 초기 로직 필요하면 여기에
  }

  @override
  Widget build(BuildContext context) {
    return MainTabScreen(
      navigationShell: widget.navigationShell,
      onAction: widget.viewModel.onAction,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/main/custom_bottom_navigation_bar.dart';
import '../../core/routing/router.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../saved_recipes/saved_recipes_screen.dart';
import '../saved_recipes/saved_recipes_view_model.dart';

class AppScaffold extends StatelessWidget {
  final StatefulNavigationShell shell;
  const AppScaffold({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: shell,
          bottom: false //하단 세이프 영역을 무시하여 콘텐츠가 네비게이션 바 뒤까지 확장되어 보이도록 함
      ),

      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => shell.goBranch(NavigationItemType.values.indexOf(NavigationItemType.add)),
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: const Icon(Icons.add),
        elevation: 0,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(shell: shell),
    );
  }
}


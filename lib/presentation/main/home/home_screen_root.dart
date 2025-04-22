import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/presentation/main/home/home_action.dart';
import 'package:recipe_app/presentation/main/home/home_screen.dart';
import 'package:recipe_app/presentation/main/home/home_view_model.dart';

class HomeScreenRoot extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, builder) {
        return HomeScreen(
          state: viewModel.state,
          onAction: (action) {
            switch (action) {
              case OnSelectCategory():
                viewModel.setCategoryFilter(action.categoryFilter);
              case OnTapFavorite():
                viewModel.toggleBookmark(action.id);
              case OnSearchTap():
                context.push(Routes.search);
            }
          }
        );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_view_model.dart';

class SearchScreenRoot extends StatelessWidget {
  final SearchViewModel viewModel;
  const SearchScreenRoot(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text('Search recipes'),
      ),
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return SearchScreen(
            state: viewModel.state,
            onAction: viewModel.onAction,
          );
        },
      ),
    );
  }
}

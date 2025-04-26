import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_action.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_screen_event.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_state.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_screen.dart';

class DetailScreenRoot extends StatefulWidget {
  DetailRecipeViewModel viewModel;
  final int recipeId;

  DetailScreenRoot({
    super.key,
    required this.viewModel,
    required this.recipeId,
  });

  @override
  State<DetailScreenRoot> createState() => _DetailScreenRootState();
}

class _DetailScreenRootState extends State<DetailScreenRoot> {
  DetailRecipeViewModel get viewModel => widget.viewModel;

  DetailRecipeState get state => widget.viewModel.state;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.getRecipeById(widget.recipeId);
    widget.viewModel.getProcedureById(widget.recipeId);
    widget.viewModel.getIngredients();
    _subscription = viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowMessageBar():
            final snackBar = SnackBar(content: Text(event.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowError():
            final showError = ShowError('');
            ScaffoldMessenger.of(context).showSnackBar(showError as SnackBar);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, _) {
        if (state.recipe == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return DetailScreen(
          state: widget.viewModel.state,
          onAction: (DetailRecipeAction action) {
            switch (action) {
              case GetRecipeById():
                widget.viewModel.getRecipeById(action.id);
              case GetProcedureById():
                widget.viewModel.getProcedureById(action.id);
              case GetIngredients():
                widget.viewModel.getIngredients();
              case CopyLink():
                widget.viewModel.copyLink(action.id);
              case GetCopyLink():
                widget.viewModel.getCopyLink(action.id);
            }
          },
          id: widget.recipeId,
        );
      },
    );
  }
}

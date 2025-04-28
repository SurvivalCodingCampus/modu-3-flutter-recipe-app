import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_action.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_state.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';

import 'saved_recipes_screen_event.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  SavedRecipesViewModel get viewModel => widget.viewModel;

  SavedRecipesState get state => widget.viewModel.state;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowSnackbar():
            final snackBar = SnackBar(content: Text(event.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        return SavedRecipesScreen(
          state: widget.viewModel.state,
          onAction: (SavedRecipesAction action) {
            switch (action) {
              case RemoveBookMark():
                widget.viewModel.removeBookmark(action.id);
              case AddBookMark():
                widget.viewModel.addBookmark(action.recipe);
            }
          },
        );
      },
    );
  }
}

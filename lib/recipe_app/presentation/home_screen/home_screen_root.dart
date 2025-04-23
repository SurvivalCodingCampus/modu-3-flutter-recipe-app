import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_action.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_state.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_view_model.dart';

import 'home_screen_event.dart';

class HomeScreenRoot extends StatefulWidget {
  HomeScreenViewModel viewModel;

  HomeScreenRoot({super.key, required this.viewModel});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  HomeScreenViewModel get viewModel => widget.viewModel;

  HomeScreenState get state => widget.viewModel.state;

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.onSelectedCategory('All');
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
        return HomeScreen(
          state: state,
          onAction: (HomeScreenAction action) {
            switch (action) {
              case SelectCategory():
                viewModel.onSelectedCategory(action.category);
                break;
              case RemoveBookMark():
                viewModel.removeBookmark(action.id);
                break;
              case AddBookMark():
                viewModel.addBookmark(action.recipe);
                break;
            }
          },
        );
      },
    );
  }
}

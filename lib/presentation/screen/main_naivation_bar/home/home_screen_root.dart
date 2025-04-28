import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/action/home_action.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/home_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/home_view_model.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/state/home_state.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreenRoot({super.key, required this.viewModel});

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  HomeViewModel get viewModel => widget.viewModel;
  HomeState get state => widget.viewModel.state;

  @override
  void initState() {
    super.initState();
    widget.viewModel.getUserData(); // 초기화 시 한번 호출
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return HomeScreen(
          state: widget.viewModel.state,
          onAction: (HomeAction action) {
            switch (action) {
              case UpdateSelectedCategory():
                viewModel.updateSelectedCategory(action.category);
              case OnClickBookMark():
                viewModel.onClickBookMark(action.recipeId);
            }
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_action.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_view_model.dart';

class RecipeInfoScreenRoot extends StatefulWidget {
  final int id;
  final RecipeInfoViewModel viewModel;
  const RecipeInfoScreenRoot({
    required this.id,
    required this.viewModel,
    super.key,
  });

  @override
  State<RecipeInfoScreenRoot> createState() => _RecipeInfoScreenRootState();
}

class _RecipeInfoScreenRootState extends State<RecipeInfoScreenRoot> {
  @override
  void initState() {
    widget.viewModel.onAction(RecipeInfoAction.getRecipeInfo(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseScreen(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          actions: const [Icon(Icons.more_horiz), SizedBox(width: 20)],
        ),
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            return RecipeInfoScreen(
              state: widget.viewModel.state,
              onAction: widget.viewModel.onAction,
            );
          },
        ),
      ),
    );
  }
}

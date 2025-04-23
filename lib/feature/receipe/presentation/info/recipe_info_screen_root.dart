import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/utils/app_show_dialog.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_action.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_state.dart';
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
          actions: [
            PopupMenuButton<InfoPopupState>(
              initialValue: widget.viewModel.state.popupState,
              onSelected: (InfoPopupState item) {},
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<InfoPopupState>>[
                    const PopupMenuItem(
                      value: InfoPopupState.share,
                      child: Row(
                        children: [
                          Icon(Icons.share_outlined),
                          SizedBox(width: 12),
                          Text('Share'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => AppShowDialog.ratingDialog(context),
                      value: InfoPopupState.rate,
                      child: const Row(
                        children: [
                          Icon(Icons.star),
                          SizedBox(width: 12),
                          Text('Rate Recipe'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: InfoPopupState.review,
                      child: Row(
                        children: [
                          Icon(Icons.chat),
                          SizedBox(width: 12),
                          Text('Review'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: InfoPopupState.unsave,
                      child: Row(
                        children: [
                          Icon(Icons.bookmark),
                          SizedBox(width: 12),
                          Text('Unsave'),
                        ],
                      ),
                    ),
                  ],
            ),
            const SizedBox(width: 20),
          ],
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

import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/rating_dialog_drag.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/ingredient/screen/ingredient_screen.dart';

class IngredientRoot extends StatefulWidget {
  final IngredientViewModel viewModel;
  const IngredientRoot({super.key, required this.viewModel});

  @override
  State<IngredientRoot> createState() => _IngredientRootState();
}

class _IngredientRootState extends State<IngredientRoot> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        return IngredientScreen(
          recipe: widget.viewModel.value,
          currentIndex: currentIndex,
          onAction: (action) {
            switch (action) {
              case OnTapClick():
                setState(() {
                  currentIndex = action.tabIndex;
                });
              case OnMenuClick():
                if (action.menuIndex == 1) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => RatingDialogDrag(
                          title: 'Rate recipe',
                          actionName: 'send',
                          onChange: (int) {},
                        ),
                  );
                }
            }
          },
          menuItemList: const ['share', 'Rate Recipe', 'Review', 'Unsave'],
        );
      },
    );
  }
}

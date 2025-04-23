import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/component/detail_recipe.dart';
import 'package:recipe_app/recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_action.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_state.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_view_model.dart';

import '../../core/di/di_setup.dart';

class DetailScreen extends StatefulWidget {
  final DetailRecipeState state;
  final void Function(DetailRecipeAction action) onAction;

  const DetailScreen({super.key, required this.state, required this.onAction});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

enum ActionItem { itemOne, itemTwo, itemThree, itemFour }

class _DetailScreenState extends State<DetailScreen> {
  final viewModel = DetailRecipeViewModel(
    repository: getIt(),
    useCase: getIt(),
  );
  final repository = RecipeRepository;
  late int id;

  ActionItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_horiz),
            onSelected: (ActionItem item) {
              if (item == ActionItem.itemTwo) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RatingDialog(
                      onChange: (value) {
                        print('Rating selected: $value');
                      },
                    );
                  },
                );
              }
            },
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<ActionItem>>[
                  const PopupMenuItem<ActionItem>(
                    value: ActionItem.itemOne,
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(width: 15),
                        Text('share'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<ActionItem>(
                    value: ActionItem.itemTwo,
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 15),
                        Text('Rate Recipe'),
                      ],
                    ),
                  ),
                  PopupMenuItem<ActionItem>(
                    value: ActionItem.itemThree,
                    child: Row(
                      children: [
                        Icon(Icons.comment),
                        SizedBox(width: 15),
                        Text('Review'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<ActionItem>(
                    value: ActionItem.itemFour,
                    child: Row(
                      children: [
                        Icon(Icons.bookmark),
                        SizedBox(width: 15),
                        Text('Unsave'),
                      ],
                    ),
                  ),
                ],
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: _buildBody(),
    );
  }

  //Widget _buildPopupMenu() {}

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: DetailRecipe(recipe: widget.state.recipe!),
    );
  }
}

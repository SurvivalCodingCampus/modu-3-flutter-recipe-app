import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/data/repository/procedure_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/component/detail_recipe.dart';
import 'package:recipe_app/recipe_app/presentation/component/procedure_step.dart';
import 'package:recipe_app/recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_action.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_state.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_view_model.dart';

import '../../core/di/di_setup.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

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
    useCase: getIt(),
    getProcedureUseCase: getIt(),
  );
  final repository = RecipeRepository;
  final procedureRepository = ProcedureRepository;
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
      body: Column(
        children: [
          _buildBody(),
          SizedBox(height: 20),
          Expanded(child: _buildProcedureBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: DetailRecipe(recipe: widget.state.recipe!),
    );
  }

  Widget _buildProcedureBody() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/food.png', height: 20, width: 20),
                  Text(
                    '1 serve',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.state.procedure.length} Steps',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.gray3,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              itemCount: widget.state.procedure.length,
              itemBuilder: (context, index) {
                final Procedure procedure = widget.state.procedure[index];
                return ProcedureStep(procedure: procedure);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/presentation/component/detail_recipe.dart';
import 'package:recipe_app/recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/recipe_app/presentation/component/procedure_step.dart';
import 'package:recipe_app/recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_action.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_state.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_view_model.dart';

import '../../core/di/di_setup.dart';
import '../../ui/button_styles.dart';
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

enum SelectedTab { ingredients, procedure }

class _DetailScreenState extends State<DetailScreen> {
  final viewModel = DetailRecipeViewModel(
    useCase: getIt(),
    getProcedureUseCase: getIt(),
    ingredientsRepository: getIt(),
  );

  late int id;
  SelectedTab _selectedTab = SelectedTab.ingredients;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBody(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabButton('Ingredients', SelectedTab.ingredients),
                    SizedBox(width: 10),
                    _buildTabButton('Procedure', SelectedTab.procedure),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child:
                      _selectedTab == SelectedTab.ingredients
                          ? _buildIngredientBody()
                          : _buildProcedureBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, SelectedTab tab) {
    final bool isSelected = _selectedTab == tab;
    return ElevatedButton(
      style:
          isSelected
              ? ButtonStyles.detailSelectedButton
              : ButtonStyles.detailUnSelectedButton,
      onPressed: () {
        setState(() {
          _selectedTab = tab;
        });
      },
      child: Text(
        title,
        style:
            isSelected
                ? TextStyles.smallerTextBold.copyWith(color: Colors.white)
                : TextStyles.smallerTextBold.copyWith(
                  color: ColorStyles.primary80,
                ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DetailRecipe(recipe: widget.state.recipe!),
    );
  }

  Widget _buildProcedureBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.state.procedure.length,
            itemBuilder: (context, index) {
              final Procedure procedure = widget.state.procedure[index];
              return ProcedureStep(procedure: procedure);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                '${widget.state.ingredient.length} Items',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.gray3,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.state.ingredient.length,
            itemBuilder: (context, index) {
              final Ingredient ingredient = widget.state.ingredient[index];
              return IngredientItem(ingredient: ingredient);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
        ],
      ),
    );
  }
}

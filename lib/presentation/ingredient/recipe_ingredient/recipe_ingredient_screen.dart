import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/procedure_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/tabs_widget.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_view_model.dart';

class RecipeIngredientScreen extends StatefulWidget {
  final RecipeIngredientViewModel viewModel;

  const RecipeIngredientScreen({super.key, required this.viewModel});

  @override
  State<RecipeIngredientScreen> createState() => _RecipeIngredientScreenState();
}

class _RecipeIngredientScreenState extends State<RecipeIngredientScreen> {
  int tabSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      backgroundColor: ColorStyles.white,
      body: ListenableBuilder(
        listenable: widget.viewModel..fetchData(),
        builder: (context, snapshot) {
          if (widget.viewModel.state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                RecipeCard(
                  showTitle: false,
                  recipe: widget.viewModel.state.recipe,
                  isBookmarked: widget.viewModel.state.isBookmarked,
                  onClick: (int id) {},
                  onBookmark: (int id) {
                    widget.viewModel.toggleBookmark(id);
                  },
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        children: [
                          Text(
                            widget.viewModel.state.recipe.name,
                            style: TextStyles.largeBold(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text('review'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        widget.viewModel.state.chef.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.viewModel.state.chef.name,
                          style: TextStyles.largeBold(),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorStyles.primary100,
                            ),
                            Text(widget.viewModel.state.chef.address),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorStyles.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Follow',
                          style: TextStyles.smallBold(color: ColorStyles.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TabsWidget(
                  onValueChange: (index) {
                    setState(() {
                      tabSelectedIndex = index;
                    });
                  },
                  labels: ['Ingredient', 'Procedure'],
                  selectedIndex: tabSelectedIndex,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.doorbell_outlined, color: ColorStyles.gray3,),
                    Text('1 serve', style: TextStyles.smallerRegular(color: ColorStyles.gray3,),),
                    Spacer(),
                    Text(
                      tabSelectedIndex == 0
                          ? '${widget.viewModel.state.ingredientList.length} items'
                          : '${widget.viewModel.state.procedureList.length} steps',
                      style: TextStyles.smallerRegular(color: ColorStyles.gray3,),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    itemCount: tabSelectedIndex == 0
                        ? widget.viewModel.state.ingredientList.length
                        : widget.viewModel.state.procedureList.length,
                    itemBuilder: (context, index) {
                      if (tabSelectedIndex == 0) {
                        return IngredientItem(
                          ingredientWithAmount: widget.viewModel.state.ingredientList[index],
                        );
                      } else {
                        return ProcedureItem(
                          procedure: widget.viewModel.state.procedureList[index],
                        );
                      }
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

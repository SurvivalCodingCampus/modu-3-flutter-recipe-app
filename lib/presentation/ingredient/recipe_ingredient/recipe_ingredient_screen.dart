import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/procedure_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/tabs_widget.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_action.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_state.dart';

class RecipeIngredientScreen extends StatelessWidget {
  final void Function(RecipeIngredientAction action) onAction;
  final RecipeIngredientState state;

  const RecipeIngredientScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_horiz),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.double_arrow_outlined),
                      SizedBox(width: 10),
                      Text('Share'),
                    ],
                  )
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 10),
                    Text('Rate Recipe'),
                  ],
                ),
                onTap: () {
                  onAction(RecipeIngredientAction.onRating());
                },
              ),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.chat),
                      SizedBox(width: 10),
                      Text('Review'),
                    ],
                  )
              ),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.bookmark),
                      SizedBox(width: 10),
                      Text('Unsave'),
                    ],
                  )
              ),
            ],
          ),
        ],
      ),
      backgroundColor: ColorStyles.white,
      body: state.isLoading ? Center(child: CircularProgressIndicator()) :
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            RecipeCard(
              showTitle: false,
              recipe: state.recipe,
              isBookmarked: state.isBookmarked,
              onClick: (int id) {},
              onBookmark: (int id) {
                onAction(RecipeIngredientAction.onBookmark(id));
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
                        state.recipe.name,
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
                    state.chef.image,
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
                      state.chef.name,
                      style: TextStyles.largeBold(),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorStyles.primary100,
                        ),
                        Text(state.chef.address),
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
                onAction(RecipeIngredientAction.onTabSelect(index));
              },
              labels: ['Ingredient', 'Procedure'],
              selectedIndex: state.tabSelectedIndex,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.doorbell_outlined, color: ColorStyles.gray3,),
                Text('1 serve', style: TextStyles.smallerRegular(color: ColorStyles.gray3,),),
                Spacer(),
                Text(
                  state.tabSelectedIndex == 0
                      ? '${state.ingredientList.length} items'
                      : '${state.procedureList.length} steps',
                  style: TextStyles.smallerRegular(color: ColorStyles.gray3,),
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: state.tabSelectedIndex == 0
                    ? state.ingredientList.length
                    : state.procedureList.length,
                itemBuilder: (context, index) {
                  if (state.tabSelectedIndex == 0) {
                    return IngredientItem(
                      ingredientWithAmount: state.ingredientList[index],
                    );
                  } else {
                    return ProcedureItem(
                      procedure: state.procedureList[index],
                    );
                  }
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
              ),
            ),
          ],
        ),
      )
    );
  }
}

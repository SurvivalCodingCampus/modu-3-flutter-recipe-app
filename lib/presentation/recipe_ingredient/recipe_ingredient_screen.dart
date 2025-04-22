import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_action.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_state.dart';

import '../../domain/model/model.dart';
import '../../ui/ui.dart';
import '../component/ingredient_item.dart';
import '../component/recipe_card.dart';
import '../component/small_button.dart';
import '../component/tabs.dart';

class RecipeIngredientScreen extends StatelessWidget {
  final int selectedIndex;
  final RecipeIngredientState state;
  final void Function(RecipeIngredientAction action) onAction;
  const RecipeIngredientScreen({
    super.key,
    required this.selectedIndex,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.recipe == null
              ? const Center(child: Text('데이터가 없습니다'))
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Builder(
                  builder: (context) {
                    final recipe = state.recipe!;
                    final procedures = state.procedures;

                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        RecipeCard(
                          recipe: recipe,
                          isDetail: true,
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5173,
                              child: Text(
                                recipe.name,
                                style: TextStyles.smallTextBold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Text('(13k Reviews)'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                recipe.imageUrl,
                                scale: 40,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.chef,
                                  style: TextStyles.smallTextBold,
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/location.png',
                                      width: 17,
                                      height: 17,
                                    ),
                                    const SizedBox(width: 1),
                                    Text(
                                      'Lagos, Nigeria',
                                      style: TextStyles.smallerTextRegular
                                          .copyWith(color: ColorStyles.gray3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            const SizedBox(
                              width: 85,
                              child: SmallButton(text: 'Follow'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Tabs(
                            labels: const ['Ingredient', 'Procedure'],
                            selectedIndex: selectedIndex,
                            onTap:
                                (index) => onAction(
                                  RecipeIngredientAction.onTapTabItem(index),
                                ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/serve.png',
                              width: 17,
                              height: 17,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '1 serve',
                              style: TextStyles.smallerTextRegular.copyWith(
                                color: ColorStyles.gray3,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              selectedIndex == 0
                                  ? '${recipe.ingredients.length} Items'
                                  : '${procedures.length} Steps',
                              style: TextStyles.smallerTextRegular.copyWith(
                                color: ColorStyles.gray3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return selectedIndex == 0
                                  ? IngredientItem(
                                    ingredient: Ingredient(
                                      id: index.toString(),
                                      name: recipe.ingredients[index].name,
                                      imageUrl:
                                          recipe.ingredients[index].imageUrl,
                                      weight: recipe.ingredients[index].weight,
                                    ),
                                  )
                                  : Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorStyles.gray4,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Step ${index + 1}'),
                                        const SizedBox(height: 5),
                                        Text(
                                          procedures[index].content,
                                          style: TextStyles.smallerTextRegular
                                              .copyWith(
                                                color: ColorStyles.gray3,
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 10);
                            },
                            itemCount:
                                selectedIndex == 0
                                    ? recipe.ingredients.length
                                    : procedures.length,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
    );
  }
}

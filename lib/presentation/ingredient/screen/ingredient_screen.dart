import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/components/ingredient_item.dart';
import 'package:recipe_app/core/presentation/components/multi_tabs.dart';
import 'package:recipe_app/core/presentation/components/recipe_detail_card.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';
import 'package:recipe_app/core/presentation/components/step_item.dart';
import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientState recipe;
  final int currentIndex;
  final void Function(int value) onTapClick;
  const IngredientScreen({
    super.key,
    required this.recipe,
    required this.currentIndex,
    required this.onTapClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GestureDetector(
            onTap: () {
              context.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 30),
        actions: const [Icon(Icons.menu)],
      ),
      body: SafeArea(
        child:
            recipe.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        RecipeDetailCard(
                          recipe: recipe.recipe,
                          onBookmarkClick: (value) {},
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                recipe.recipe.foodName,
                                style: AppTextStyles.smallBold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '(13K Reviews)',
                              style: AppTextStyles.mediumRegular.copyWith(
                                color: ColorStyle.gray3,
                              ),
                            ),
                          ],
                        ),
                        _ChefData(recipe: recipe),
                        SizedBox(
                          height: 58,
                          child: MultiTabs(
                            labels: const ['Ingredient', 'Procedure'],
                            selectedIndex: currentIndex,
                            onValueChange: onTapClick,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.restaurant,
                                  color: ColorStyle.gray3,
                                  size: 17,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '1 Serve',
                                  style: AppTextStyles.smallRegular.copyWith(
                                    color: ColorStyle.gray3,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${currentIndex == 0 ? recipe.recipe.ingredients.length : recipe.procedures.length} items',
                              style: AppTextStyles.smallRegular.copyWith(
                                color: ColorStyle.gray3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        currentIndex == 0
                            ? _IngredientColumn(
                              ingredients: recipe.recipe.ingredients,
                            )
                            : _ProcedureColumn(procedures: recipe.procedures),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}

class _ProcedureColumn extends StatelessWidget {
  const _ProcedureColumn({required this.procedures});

  final List<Procedure> procedures;

  @override
  Widget build(BuildContext context) {
    return procedures.isEmpty
        ? Center(
          child: Text(
            '등록된 요리 순서가 없습니다.',
            style: AppTextStyles.mediumRegular.copyWith(
              color: ColorStyle.gray3,
            ),
          ),
        )
        : Column(
          spacing: 10,
          children:
              procedures.map((e) {
                return StepItem(procedure: e);
              }).toList(),
        );
  }
}

class _IngredientColumn extends StatelessWidget {
  const _IngredientColumn({required this.ingredients});

  final List<Ingredients> ingredients;

  @override
  Widget build(BuildContext context) {
    return ingredients.isEmpty
        ? Center(
          child: Text(
            '등록된 재료가 없습니다.',
            style: AppTextStyles.mediumRegular.copyWith(
              color: ColorStyle.gray3,
            ),
          ),
        )
        : Column(
          spacing: 10,
          children:
              ingredients.map((e) {
                return IngredientItem(
                  ingredientName: e.ingredient.name,
                  imageName: e.ingredient.image,
                  amount: '${e.amount}g',
                );
              }).toList(),
        );
  }
}

class _ChefData extends StatelessWidget {
  const _ChefData({required this.recipe});

  final IngredientState recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 20,
          backgroundColor: ColorStyle.secondary60,
          child: Image.asset('assets/images/drake.png'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recipe.recipe.chef, style: AppTextStyles.smallBold),
              Row(
                children: [
                  const Icon(Icons.map, color: ColorStyle.primary80),
                  const SizedBox(width: 1),
                  Text(
                    'Lagos, Nigeria',
                    style: AppTextStyles.smallRegular.copyWith(
                      color: ColorStyle.gray3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 85, child: SmallButton(text: 'Follow', onClick: () {})),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

class RecipeIngredientScreen extends StatefulWidget {
  final String recipeId;
  final RecipeIngredientViewModel viewModel;
  const RecipeIngredientScreen({
    super.key,
    required this.recipeId,
    required this.viewModel,
  });

  @override
  State<RecipeIngredientScreen> createState() => _RecipeIngredientScreenState();
}

class _RecipeIngredientScreenState extends State<RecipeIngredientScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRecipeIngredient(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset('assets/icons/more.png', width: 24, height: 24),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          if (widget.viewModel.state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (widget.viewModel.state.recipe == null) {
            return const Center(child: Text('데이터가 없습니다'));
          }

          final recipe = widget.viewModel.state.recipe!;
          final procedures = widget.viewModel.state.procedures;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  RecipeCard(recipe: recipe, isDetail: true, onTap: () {}),
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
                          Text(recipe.chef, style: TextStyles.smallTextBold),
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
                                style: TextStyles.smallerTextRegular.copyWith(
                                  color: ColorStyles.gray3,
                                ),
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
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
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
                                imageUrl: recipe.ingredients[index].imageUrl,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Step ${index + 1}'),
                                  const SizedBox(height: 5),
                                  Text(
                                    procedures[index].content,
                                    style: TextStyles.smallerTextRegular
                                        .copyWith(color: ColorStyles.gray3),
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
              ),
            ),
          );
        },
      ),
    );
  }
}

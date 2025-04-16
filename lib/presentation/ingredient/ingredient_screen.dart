import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class IngredientScreen extends StatefulWidget {
  final int recipeId;
  final IngredientScreenViewModel viewModel;

  const IngredientScreen({
    super.key,
    required this.recipeId,
    required this.viewModel,
  });

  @override
  State<IngredientScreen> createState() => _IngredientScreenState();
}

class _IngredientScreenState extends State<IngredientScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipe(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.arrow_back, size: 20),
                          onTap: () => context.pop(context),
                        ),
                        GestureDetector(
                          child: const Icon(Icons.more_horiz, size: 24),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ListenableBuilder(
                      listenable: widget.viewModel,
                      builder: (context, child) {
                        if (widget.viewModel.isLoading) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        return Column(
                          spacing: 10,
                          children: [
                            RecipeCard(
                              recipe: widget.viewModel.state.recipe!,
                              onBookmarkTap: () {},
                              showTitle: false,
                              showAuthor: false,
                              showRating: false,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 194,
                                  height: 41,
                                  child: Text(
                                    widget.viewModel.recipe!.name,
                                    style: TextStyles.smallTextBold,
                                    maxLines: 2,
                                  ),
                                ),
                                Text(
                                  '(13k Reviews)',
                                  style: TextStyles.smallTextRegular.copyWith(
                                    color: ColorStyles.gray3,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: ColorStyles.gray4,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const SizedBox(),
                                ),
                                Column(
                                  spacing: 2,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.viewModel.recipe!.chef,
                                      style: TextStyles.smallTextBold.copyWith(
                                        color: ColorStyles.label,
                                      ),
                                    ),
                                    Row(
                                      spacing: 1,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 17,
                                          color: ColorStyles.primary80,
                                        ),
                                        Text(widget.viewModel.recipe!.chef),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SmallButton(onPressed: () {}, text: 'Follow'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            MultiTab(
                              labels: const ['Ingrident', 'Procedure'],
                              onValueChange: (index) {},
                              selectedIndex: 0,
                            ),
                            const SizedBox(height: 22),
                            Row(
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    const Icon(
                                      Icons.room_service_outlined,
                                      color: ColorStyles.gray3,
                                    ),
                                    Text(
                                      '1 serve',
                                      style: TextStyles.smallTextRegular
                                          .copyWith(color: ColorStyles.gray3),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '${widget.viewModel.recipe!.ingredients.length} items',
                                      style: TextStyles.smallTextRegular
                                          .copyWith(color: ColorStyles.gray3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Column(
                              spacing: 10,
                              children: List.generate(
                                widget.viewModel.recipe!.ingredients.length,
                                (index) => IngredientItem(
                                  ingredient:
                                      widget
                                          .viewModel
                                          .recipe!
                                          .ingredients[index],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

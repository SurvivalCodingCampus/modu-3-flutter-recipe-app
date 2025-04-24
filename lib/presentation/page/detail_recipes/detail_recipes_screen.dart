import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_action.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_view_model.dart';
import 'package:recipe_app/presentation/common/component/ingredient_item.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class DetailRecipesScreen extends StatelessWidget {
  final DetailRecipesViewModel viewModel;
  const DetailRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorStyle.white,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () => viewModel.onAction(const DetailRecipesAction.toggleMoreMenu()),
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(state.recipesData.image, fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                state.recipesData.name,
                                style: AppTextStyles.smallBold(),
                                maxLines: 2,
                              ),
                            ),
                            Text(
                              '(13k Reviews)',
                              style: AppTextStyles.normalRegular().copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(backgroundColor: ColorStyle.gray4),
                                const SizedBox(width: 5),
                                Text(state.recipesData.author),
                              ],
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorStyle.primary100,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Follow',
                                style: AppTextStyles.smallBold(color: ColorStyle.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1 serve', style: AppTextStyles.smallRegular(color: ColorStyle.gray3)),
                            Text('${state.recipesData.ingredients.length} items',
                                style: AppTextStyles.smallRegular(color: ColorStyle.gray3)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.recipesData.ingredients.length,
                            itemBuilder: (context, index) {
                              final item = state.recipesData.ingredients[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: IngredientItem(
                                  backgroundColor: ColorStyle.gray4,
                                  imagePath: item.ingredient!.image.toString(),
                                  imageType: ImageType.network,
                                  name: item.ingredient!.name.toString(),
                                  content: item.ingredient!.id.toString(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (state.showMoreMenu)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => viewModel.onAction(const DetailRecipesAction.closeMoreMenu()),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        if (state.showMoreMenu)
          Positioned(
            top: MediaQuery.of(context).padding.top + kToolbarHeight - kToolbarHeight/2 + 8,
            right: 20,
            child: Material(
              color: ColorStyle.white,
              textStyle:  AppTextStyles.smallRegular(color: ColorStyle.black),
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => viewModel.onAction(const DetailRecipesAction.closeMoreMenu()),
                    child: Text('share', style: AppTextStyles.smallRegular(color: ColorStyle.black),),
                  ),
                  TextButton(
                    onPressed: () => viewModel.onAction(const DetailRecipesAction.closeMoreMenu()),
                    child: Text('Rate Recipes', style: AppTextStyles.smallRegular(color: ColorStyle.black),),
                  ),
                  TextButton(
                    onPressed: () => viewModel.onAction(const DetailRecipesAction.closeMoreMenu()),
                    child: Text('Review', style: AppTextStyles.smallRegular(color: ColorStyle.black),),
                  ),
                  TextButton(
                    onPressed: () => viewModel.onAction(const DetailRecipesAction.closeMoreMenu()),
                    child: Text('UnSave', style: AppTextStyles.smallRegular(color: ColorStyle.black),),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
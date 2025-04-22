import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/core/ui/ui_size.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/recipe_ingredient.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';
import 'package:recipe_app/presentation/component/rating_dialog_content.dart';
import 'package:recipe_app/presentation/component/recipe_component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipeStep.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipe_author.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipe_card.dart';
import 'package:recipe_app/presentation/component/tabs.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_action.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_state.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeDetailState state;
  final int recipeId;
  final void Function(RecipeDetailAction action) onAction;

  const RecipeDetailScreen({
    super.key,
    required this.state,
    required this.recipeId,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    const color = ColorStyle.labelColour;
    final style = AppTextStyles.smallRegular(color: color);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: ColorStyle.white,
            onSelected: (value) {},
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'share',
                  child: Row(
                    children: [
                      const Icon(Icons.share, size: 20, color: color),
                      const SizedBox(width: 16),
                      Text('share', style: style),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'rate',
                  onTap: () => showRatingDialog(context),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 20, color: color),
                      const SizedBox(width: 16),
                      Text('Rate Recipe', style: style),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'review',
                  child: Row(
                    children: [
                      const Icon(Icons.chat_bubble, size: 20, color: color),
                      const SizedBox(width: 16),
                      Text('Review', style: style),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'unsave',
                  child: Row(
                    children: [
                      const Icon(Icons.bookmark, size: 20, color: color),
                      const SizedBox(width: 16),
                      Text('Unsave', style: style),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: switch (state.recipe) {
        UiLoading() => const Center(child: CircularProgressIndicator()),
        UiError(message: final msg) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('에러 발생: $msg'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => onAction(const RecipeDetailAction.onRetry()),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
        UiSuccess(data: final recipe) => _buildLoadedUI(context, recipe),
        _ => const SizedBox(),
      },
    );
  }

  Widget _buildLoadedUI(BuildContext context, Recipe recipe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지 카드
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: RecipeCard(
                  title: recipe.name,
                  imagePath: recipe.image,
                  cookTime: recipe.time,
                  authorName: recipe.chef,
                  rating: recipe.rating,
                  isFavorite: true,
                  showTitle: false,
                  showAuthorName: false,
                  onTap: () {},
                  onFavoriteTap: null,
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    SizedBox(
                      width: responsiveWidth(context, ratio: 194 / 375),
                      child: Text(
                        recipe.name,
                        style: AppTextStyles.smallBold(),
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '(13k Reviews)',
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.gray3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // 작성자 정보
              RecipeAuthor(
                authorName: recipe.chef,
                path: 'assets/images/profile/sample_profile.png',
                location: '집 이겠지',
                onFollowTap: () {},
              ),

              const SizedBox(height: 20),

              // 탭
              Tabs(
                tabTitles: const ['Ingredients', 'Procedure'],
                selectedIndex: state.selectedTabIndex,
                onTabSelected:
                    (index) => onAction(RecipeDetailAction.onSelectTab(index)),
              ),
              const SizedBox(height: 35),

              SizedBox(
                height: 24,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 17,
                      height: 17,
                      child: AppImage(path: 'assets/images/icons/dish.png'),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '1 serve',
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.gray3,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      (state.selectedTabIndex == 0)
                          ? '${recipe.ingredients.length} Items'
                          : '${recipe.steps.length} Steps',
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.gray3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // 콘텐츠
        Expanded(
          child: switch (state.selectedTabIndex) {
            0 => _buildIngredientList(recipe.ingredients),
            1 => _buildStepList(recipe.steps),
            _ => const SizedBox(),
          },
        ),
      ],
    );
  }

  Widget _buildIngredientList(List<RecipeIngredient> ingredients) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      itemCount: ingredients.length,
      itemBuilder: (_, index) {
        final item = ingredients[index];
        return IngredientItem(
          title: item.ingredient.name,
          imagePath: item.ingredient.image,
          weight: '${item.amount}g',
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
    );
  }

  Widget _buildStepList(List<String> steps) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      itemCount: steps.length,
      itemBuilder: (_, index) {
        final item = steps[index];
        return RecipeStep(description: item, index: index);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
    );
  }

  void showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            content: RatingDialogContent(
              title: 'Rate recipe',
              submitTitle: 'Send',
              onSubmitted: (rating) {
                onAction(RecipeDetailAction.onRate(rating));
                Navigator.of(context).pop();
              },
            ),
          ),
    );
  }
}

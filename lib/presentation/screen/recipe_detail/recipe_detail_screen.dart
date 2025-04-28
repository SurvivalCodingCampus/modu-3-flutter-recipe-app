import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/buttons/buttons.dart';
import 'package:recipe_app/core/component/item_card/ingredient_item.dart';
import 'package:recipe_app/core/component/item_card/recipe_card.dart';
import 'package:recipe_app/core/component/tabs/tabs.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/action/recipe_detail_action.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_popup_menu.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/state/recipe_detail_state.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeId;
  final RecipeDetailState state;
  final void Function(RecipeDetailAction action) onAction;

  const RecipeDetailScreen({
    super.key,
    required this.recipeId,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    if (state.isLoading || state.recipe == null) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorStyle.gray4,
          strokeWidth: 3,
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back, color: ColorStyle.label),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true, // 배경 클릭시 창 닫기 허용
                      barrierColor: Colors.black.withOpacity(0.5), // 배경 어둡게 설정
                      builder: (BuildContext context) {
                        return RecipePopupMenu(
                          recipeId: recipeId,
                          onTabMenu: (menu) => onAction(RecipeDetailAction.onTapMenu(menu)),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.more_horiz, color: ColorStyle.label),
                ),
              ],
            ),
            const SizedBox(height: 10),
            RecipeCard(
              recipe: state.recipe!,
              isNotTitleArea: true,
              onBookMarkTap: () {
                print('토글기능구현 예정');
              },
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목: 자동 줄바꿈, 오른쪽 공간까지 최대 사용
                Expanded(
                  child: Text(
                    state.recipe!.title,
                    style: AppTextStyles.smallBold(),
                    softWrap: true,
                  ),
                ),
                const SizedBox(width: 8), // 제목과 리뷰 사이 여백
                // 리뷰: 오른쪽 고정
                Text(
                  '(13k Reviews)',
                  style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorStyle.gray4,
                    image: DecorationImage(
                      image:
                          state.user!.imageUrl?.startsWith('http') == true
                              ? NetworkImage(state.user!.imageUrl!)
                              : AssetImage(state.user!.imageUrl ?? '')
                                  as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.user!.name, style: AppTextStyles.smallBold()),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 17,
                          color: ColorStyle.primary100,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          state.user!.address,
                          style: AppTextStyles.smallRegular(
                            color: ColorStyle.gray3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Expanded(
                  child: Buttons(
                    text: 'Follow',
                    onPressed: () {
                      print('팔로우');
                    },
                    size: ButtonSize.small,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),
            Tabs(
              labels: const ['Ingrident', 'Procedure'],
              selectIndex: state.selectedTabIndex,
              onValueChange: (index) {
                onAction(RecipeDetailAction.changeTabIndex(index));
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: IndexedStack(
                index: state.selectedTabIndex,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.food_bank, color: ColorStyle.gray3),
                                const SizedBox(width: 4),
                                Text(
                                  '1 serve',
                                  style: AppTextStyles.smallRegular(
                                    color: ColorStyle.gray3,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${state.recipe!.ingredient.length} Items',
                              style: AppTextStyles.smallRegular(
                                color: ColorStyle.gray3,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          padding: const EdgeInsets.only(bottom: 12),
                          itemCount: state.recipe!.ingredient.length,
                          shrinkWrap: true,
                          // 내부 높이 계산 허용
                          physics: NeverScrollableScrollPhysics(),
                          // 스크롤 비활성화 (SingleChildScrollView로만)
                          itemBuilder: (context, index) {
                            return IngredientItem(
                              ingredient: state.recipe!.ingredient[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cooking Steps', style: AppTextStyles.smallBold()),
                        const SizedBox(height: 16),
                        ListView.builder(
                          itemCount: state.procedure!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final step = state.procedure![index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: ColorStyle.gray4,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: ColorStyle.primary100,
                                    child: Text(
                                      '${step.step}',
                                      style: AppTextStyles.smallRegular(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      step.content,
                                      style: AppTextStyles.smallRegular(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

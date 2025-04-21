import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/buttons.dart';
import 'package:recipe_app/core/component/ingredient_item.dart';
import 'package:recipe_app/core/component/recipe_card.dart';
import 'package:recipe_app/core/component/tabs.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_detail_view_model.dart';

class RecipeDetailScreen extends StatefulWidget {
  final int recipeId;
  final RecipeDetailViewModel viewModel;
  // 레시피 상세화면에서 필요한 데이터는 recipeId로 대체

  const RecipeDetailScreen({
    super.key,
    required this.recipeId,
    required this.viewModel,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipe(widget.recipeId); // 최초 1회만 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          final recipe = widget.viewModel.state.recipe;
          final isLoading = widget.viewModel.state.isLoading;
          final user = widget.viewModel.state.user;
          final procedure = widget.viewModel.state.procedure;

          if (isLoading || recipe == null) {
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
                          print('모달들어올자리');
                        },
                        child: Icon(Icons.more_horiz, color: ColorStyle.label),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RecipeCard(
                    recipe: recipe,
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
                          recipe.title,
                          style: AppTextStyles.smallBold(),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(width: 8), // 제목과 리뷰 사이 여백
                      // 리뷰: 오른쪽 고정
                      Text(
                        '(13k Reviews)',
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.gray3,
                        ),
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
                                user!.imageUrl?.startsWith('http') == true
                                    ? NetworkImage(user.imageUrl!)
                                    : AssetImage(user.imageUrl ?? '')
                                        as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name, style: AppTextStyles.smallBold()),
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
                                user.address,
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
                    selectIndex: widget.viewModel.state.selectedTabIndex,
                    onValueChange: widget.viewModel.changeTabIndex,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: IndexedStack(
                      index: widget.viewModel.state.selectedTabIndex,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.food_bank,
                                        color: ColorStyle.gray3,
                                      ),
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
                                    '${recipe.ingredient.length} Items',
                                    style: AppTextStyles.smallRegular(
                                      color: ColorStyle.gray3,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ListView.builder(
                                padding: const EdgeInsets.only(bottom: 12),
                                itemCount: recipe.ingredient.length,
                                shrinkWrap: true, // 내부 높이 계산 허용
                                physics:
                                    NeverScrollableScrollPhysics(), // 스크롤 비활성화 (SingleChildScrollView로만)
                                itemBuilder: (context, index) {
                                  return IngredientItem(
                                    ingredient: recipe.ingredient[index],
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
                              Text(
                                'Cooking Steps',
                                style: AppTextStyles.smallBold(),
                              ),
                              const SizedBox(height: 16),
                              ListView.builder(
                                itemCount: procedure!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final step = procedure[index];
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundColor:
                                              ColorStyle.primary100,
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
                                            step.content ?? '',
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
        },
      ),
    );
  }
}

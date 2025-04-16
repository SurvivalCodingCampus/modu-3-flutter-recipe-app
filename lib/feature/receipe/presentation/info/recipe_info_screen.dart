import 'package:flutter/material.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/presentation/widgets/tab/app_tabbar.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/feature/receipe/data/data_source/info/mock/mock_recipe_info_data_source_impl.dart';
import 'package:recipe_app/feature/receipe/data/repository/info/recipe_info_repository_impl.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/info/get_recipe_info_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_view_model.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/follow_button.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/ingredient_item.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

final _viewModel = RecipeInfoViewModel(
  GetRecipeInfoUseCase(
    RecipeInfoRepositoryImpl(MockRecipeInfoDataSourceImpl()),
  ),
);

class RecipeInfoScreen extends StatelessWidget {
  final int id;
  const RecipeInfoScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseScreen(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          actions: const [Icon(Icons.more_horiz), SizedBox(width: 20)],
        ),
        child: ListenableBuilder(
          listenable: _viewModel..getRecipeInfo(id),
          builder: (context, child) {
            final recipe = _viewModel.state.recipe;
            if (recipe == null) {
              return const Text('data');
            }
            return StateHandling(
              _viewModel.state.state,
              complete: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    RecipeCard.toInfo(recipe: recipe, bookmarkTap: () {}),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              recipe.name,
                              style: AppTextStyle.normalBold,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              '13k Riviews',
                              style: AppTextStyle.normalRegular.copyWith(
                                color: AppColor.grey3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              width: 40,
                              height: 40,
                              'https://i.pinimg.com/736x/19/72/24/197224dd3c41fc7ad6bef54cc6715209.jpg',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.chef,
                                  style: AppTextStyle.smallBold,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: AppColor.primary100,
                                    ),
                                    Text(
                                      'Laura wilson',
                                      style: AppTextStyle.smallerRegular
                                          .copyWith(color: AppColor.grey3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          FollowButton(onTap: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: AppTabBar(tabs: _tabs, onValueChange: (val) {}),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.room_service_outlined,
                              color: AppColor.grey3,
                            ),
                            Text(
                              '1 serve',
                              style: AppTextStyle.smallerRegular.copyWith(
                                color: AppColor.grey3,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${recipe.ingredients.length} items',
                          style: AppTextStyle.smallerRegular.copyWith(
                            color: AppColor.grey3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: recipe.ingredients.length,
                        itemBuilder: (context, index) {
                          final ingredient = recipe.ingredients[index];
                          return IngredientItem(
                            imgUrl: ingredient.ingredient.image,
                            name: ingredient.ingredient.name,
                            weight: ingredient.amount,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static const List<String> _tabs = ['Ingredient', 'Procedure'];
}

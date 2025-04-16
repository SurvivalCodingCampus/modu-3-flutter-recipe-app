import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/presentation/widgets/button/app_button.dart';
import 'package:recipe_app/core/presentation/widgets/tab/app_tabbar.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/ingredient_item.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

class RecipeInfoScreen extends StatelessWidget {
  final int id;
  const RecipeInfoScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseScreen(
        appBar: AppBar(actions: const [Icon(Icons.more_horiz)]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
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
                        Text('Laura wilson', style: AppTextStyle.smallBold),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColor.primary100,
                            ),
                            Text(
                              'Laura wilson',
                              style: AppTextStyle.smallerRegular.copyWith(
                                color: AppColor.grey3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    text: 'Follow',
                    onClick: () {},
                    type: ButtonType.small,
                  ),
                ],
              ),
              AppTabBar(tabs: _tabs, onValueChange: (val) {}),
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
                    '10 items',
                    style: AppTextStyle.smallerRegular.copyWith(
                      color: AppColor.grey3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const IngredientItem(
                      imgUrl:
                          'https://img.freepik.com/free-psd/juicy-cheeseburger-gourmet-burger-perfection_632498-25274.jpg?semt=ais_hybrid&w=740',
                      name: 'name',
                      weight: 500,
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
      ),
    );
  }

  static const List<String> _tabs = ['Ingredient', 'Procedure'];
}

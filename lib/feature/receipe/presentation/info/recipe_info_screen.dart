import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/presentation/widgets/button/app_button.dart';
import 'package:recipe_app/core/presentation/widgets/tab/app_tabbar.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/ingredient_item.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

class RecipeInfoScreen extends StatelessWidget {
  final int id;
  const RecipeInfoScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(actions: const [Icon(Icons.more_horiz)]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Image.network(
                  width: 40,
                  height: 40,
                  'https://i.pinimg.com/736x/19/72/24/197224dd3c41fc7ad6bef54cc6715209.jpg',
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    children: [
                      Text('Laura wilson'),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text('Laura wilson'),
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
            AppTabBar(tabs: const [], onValueChange: (val) {}),
            const SizedBox(height: 22),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.room_service_outlined),
                    Text('1 serve'),
                  ],
                ),
                Text('10 items'),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const IngredientItem(
                  imgUrl:
                      'https://img.freepik.com/free-psd/juicy-cheeseburger-gourmet-burger-perfection_632498-25274.jpg?semt=ais_hybrid&w=740',
                  name: 'name',
                  weight: 500,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/dish_card.dart';
import 'package:recipe_app/presentation/component/recipe_category_selector.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

import '../../ui/ui.dart';
import '../component/filter_icon_button.dart';
import '../component/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;
  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello Jella', style: TextStyles.largeTextBold),
                  Text(
                    'What are you cooking today?',
                    style: TextStyles.smallerTextRegular,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorStyles.secondary40,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset('assets/images/profile.png'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onAction(const HomeAction.onTapSearch()),
                  behavior: HitTestBehavior.opaque,
                  child: const IgnorePointer(
                    child: SizedBox(
                      height: 40,
                      child: SearchTextField(
                        placeholder: 'Search recipe',
                        isReadOnly: true,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const FilterIconButton(),
            ],
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RecipeCategorySelector(
              categories: state.categories,
              selectedCategory: state.category,
              onSelected:
                  (category) => onAction(HomeAction.onTapCategory(category)),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 231,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    state.recipes
                        .map(
                          (e) => DishCard(
                            recipe: e,
                            onTapFavorite: (e) {
                              onAction(HomeAction.onTapFavorite(e));
                            },
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

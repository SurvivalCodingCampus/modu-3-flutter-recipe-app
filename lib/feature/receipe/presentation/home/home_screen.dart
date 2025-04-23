import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/router/routes.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/presentation/widgets/textfield/search_textfield.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_action.dart';
import 'package:recipe_app/feature/receipe/presentation/home/home_state.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/filter_button.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/filter_search_button.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;
  const HomeScreen({required this.state, required this.onAction, super.key});

  @override
  Widget build(BuildContext context) {
    if (state.state == ViewState.loading) {
      return const BaseScreen(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Jega', style: AppTextStyle.largeBold),
                    Text(
                      'What are you cooking today?',
                      style: AppTextStyle.smallerRegular.copyWith(
                        color: AppColor.grey3,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.secondary40,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    'https://d2v80xjmx68n4w.cloudfront.net/gigs/rate/Y5kS81712538659.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                context.push(AppRoutes.search);
              },
              child: Row(
                children: [
                  Expanded(
                    child: SearchTextfield(
                      controller: TextEditingController(),
                      onChanged: (val) {},
                      enabled: false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  FilterSearchButton(() {}),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children:
                      _categories
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: FilterButton(
                                text: e,
                                isSelected: state.filter == e,
                                onTap: () {
                                  onAction(HomeAction.sortRecipes(e));
                                },
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    state.filteredRecipes
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: HomeCard(e),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> get _categories => [
    'All',
    'Indian',
    'Asian',
    'Chinese',
    'Japanese',
    'American',
    'British',
    'Italian',
    'French',
  ];
}

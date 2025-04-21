import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/filter_list.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class HomeScreen extends StatefulWidget {
  final SearchRecipesViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello Jega", style: TextStyles.largeTextBold),
                          Text(
                            "What are you cooking today?",
                            style: TextStyles.smallerTextRegular.copyWith(
                              color: ColorStyles.gray3,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorStyles.secondary40,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/home_profile.png'),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 260,
                        child: InputField(
                          label: '',
                          placeHolder: 'Search recipe',
                          isSearch: true,
                          controller: TextEditingController(text: ''),
                          onValueChange: (String value) async {
                            await widget.viewModel.fetchSearchedRecipes(value);
                          },
                        ),
                      ),
                      FilterList(
                        ontap: () {
                          context.push(Routes.search);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

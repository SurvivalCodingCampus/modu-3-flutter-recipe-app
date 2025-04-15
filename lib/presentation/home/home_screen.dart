import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/search_text_filter.dart';

import '../../ui/color.dart';
import '../../ui/text.dart';
import '../search_recipes/search_recipe_view_model.dart';



class HomeScreen extends StatelessWidget {
  final SearchRecipeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ValueNotifier(false),
      builder: (context, index) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello Karina',
                              style: TextStyles.largeTextBold,
                            ),
                            Text('What are you cooking today?',
                              style: TextStyles.smallerTextRegular.copyWith(
                                color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 50,
                          height: 50,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorStyles.secondary40,
                          ),
                          child: Image.asset('assets/images/karina.png')
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SearchTextFilter(viewModel: viewModel)
              ],
            ),
          ),
        );
      }
    );
  }
}

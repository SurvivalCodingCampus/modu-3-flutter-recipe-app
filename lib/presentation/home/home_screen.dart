import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/components/f_input_field.dart';
import 'package:recipe_app/presentation/components/f_search_filter_button.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Jega',
                          style: TextStyles.largeTextBold(
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'What are you cooking today?',
                          style: TextStyles.smallerTextRegular(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary40,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/profile_image.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          context.push(Routes.search);
                        },
                        child: AbsorbPointer(
                          child: FInputField(
                            placeHolder: 'Search recipe',
                            value: '',
                            isVisibleSearchIcon: true,
                            onValueChange: (_) {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    FSearchFilterButton(voidCallback: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

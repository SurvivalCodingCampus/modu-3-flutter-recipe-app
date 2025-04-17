import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/search_field.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Jilong',
                          style: AppTextStyles.largeBold(
                            color: ColorStyle.black,
                          ),
                        ),
                        Text(
                          'Welcome Back!',
                          style: AppTextStyles.smallRegular(
                            color: ColorStyle.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyle.gray4,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile_img.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SearchField(
                  placeHolder: 'Search recipe',
                  value: '',
                  onValueChange: (value) {},
                  onFilterPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

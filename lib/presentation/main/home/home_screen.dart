import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Jega', style: TextStyles.largeBold(),),
                        Text('What are you cooking today?', style: TextStyles.smallerRegular(color: ColorStyles.gray4),)
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorStyles.secondary40,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset('assets/images/face.png', width: 24, height: 24,)
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        key: const Key('textField'),
                        readOnly: true,
                        onTap: () {
                          context.push(Routes.search);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search recipe',
                          hintStyle: TextStyles.smallRegular(color: ColorStyles.gray4),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: ColorStyles.gray4,
                            size: 30,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: ColorStyles.primary100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.tune,
                          size: 30,
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

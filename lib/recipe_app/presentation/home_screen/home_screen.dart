import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_bottom_sheet.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final FilterSearchViewModel filterSearchViewModel;

  const HomeScreen({super.key, required this.filterSearchViewModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Jega', style: TextStyles.largeTextBold),
                        Text(
                          'What are you cooking today?',
                          style: TextStyles.smallerTextRegular,
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
                      child: Image.asset('assets/icons/character.png'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorStyles.gray4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorStyles.gray4),
                          ),
                          prefixIcon: Icon(Icons.search, size: 18),
                          prefixIconColor: ColorStyles.gray4,
                          hintText: 'Search recipe',
                          hintStyle: TextStyles.smallerTextRegular,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return FilterSearchBottomSheet(
                                filterSearchViewModel: filterSearchViewModel,
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorStyles.primary100,
                          padding: EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/filter.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
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

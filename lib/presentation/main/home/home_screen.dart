import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/search_input_field.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 30, left: 30, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello', style: TextFontStyle.largeBold()),
                    Text(
                      'What are you cooking today?',
                      style: TextFontStyle.extraSmallRegular(
                        color: ColorStyle.gray3,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorStyle.secondary40,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.person),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 20,
              children: [
                SearchInputField(
                  placeholder: 'Search recipe',
                  onValueChange: (value) {},
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyle.primary100,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune_rounded),
                    color: ColorStyle.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

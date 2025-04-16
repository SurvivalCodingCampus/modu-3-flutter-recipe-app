import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/presentation/widgets/textfield/search_textfield.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/filter_search_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Expanded(
                  child: SearchTextfield(
                    controller: _search,
                    onChanged: (val) {},
                  ),
                ),
                FilterSearchButton(() {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons/box_icon_button.dart';
import 'package:recipe_app/presentation/component/form/search_bar.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Jega',
                    style: TextStyles.largeTextBold.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  Text(
                    'What are you cooking today?',
                    style: TextStyles.smallTextRegular.copyWith(
                      color: ColorStyles.gray3,
                    ),
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
                child: const Icon(Icons.verified_user_sharp),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: SearchInput(
                  hintText: 'Search recipes',
                  onSubmitted: (value) {},
                ),
              ),
              BoxIconButton(onPressed: () {}, icon: Icons.tune),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_icon_button.dart';
import 'package:recipe_app/presentation/component/search_text_field.dart';
import 'package:recipe_app/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello Jella', style: TextStyles.largeTextBold),
                      Text(
                        'What are you cooking today?',
                        style: TextStyles.smallerTextRegular,
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
                    child: Image.asset('assets/images/profile.png'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Expanded(
                    child: SearchTextField(placeholder: 'Search recipe'),
                  ),
                  SizedBox(width: 20),
                  FilterIconButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

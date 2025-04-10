import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/ui/color_style.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('버튼 컴포넌트')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  BigButton(
                    name: 'Big Button',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      print('나는 빅버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  MediumButton(
                    name: 'Button',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      print('나는 미디움버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  SmallButton(
                    name: 'Small Button',
                    color: ColorStyles.primary100,

                    onClick: () {
                      print('나는 스몰버튼');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

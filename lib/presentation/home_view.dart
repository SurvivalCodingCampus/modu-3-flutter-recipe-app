import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/button/medium_button.dart';
import 'package:recipe_app/presentation/component/button/small_button.dart';

import 'package:recipe_app/ui/text_font_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈 화면', style: TextFontStyle.largeBold()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigButton(
              text: 'Button',
              onTap: () {
                print('Big Button click 성공');
              },
            ),
            SizedBox(height: 10),
            MediumButton(
              text: 'Button',
              onTap: () {
                print('Medium Button click 성공');
              },
            ),
            SizedBox(height: 10),
            SmallButton(
              text: 'Button',
              onTap: () {
                print('Small Button click 성공');
              },
            ),
          ],
        ),
      ),
    );
  }
}

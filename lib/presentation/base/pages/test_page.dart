import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/presentation/base/widgets/button/app_button.dart';
import 'package:recipe_app/presentation/base/widgets/tab/app_tabbar.dart';
import 'package:recipe_app/presentation/base/widgets/textfield/app_textfield.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Label', 'Label'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(text: 'big', onClick: () {}),
            const SizedBox(height: 8),
            AppButton(text: 'medium', type: ButtonType.medium, onClick: () {}),
            const SizedBox(height: 8),
            AppButton(text: 'small', type: ButtonType.small, onClick: () {}),
            const SizedBox(height: 8),
            AppTextField(
              controller: TextEditingController(),
              hintText: 'placeHolder',
            ),
            const SizedBox(height: 8),
            AppTabBar(
              tabs: tabs,
              onValueChange: (val) {
                print('value: $val');
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons.dart';
import 'package:recipe_app/ui/text_styles.dart';

class ButtonExampleScreen extends StatelessWidget {
  const ButtonExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Buttons(
                text: 'Button',
                size: ButtonSize.big,
                onPressed: () {
                  print('큰버튼');
                },
              ),
              const SizedBox(height: 8),
              Buttons(
                text: 'Button',
                size: ButtonSize.big,
                icon: Icons.arrow_forward,
                onPressed: () {
                  print('아이콘큰버튼');
                },
              ),
              const SizedBox(height: 8),
              Buttons(
                text: 'Button',
                size: ButtonSize.medium,
                isDisabled: true,
                onPressed: () {
                  print('중간 버튼');
                },
              ),
              const SizedBox(height: 8),
              Buttons(
                text: 'Button',
                size: ButtonSize.medium,
                icon: Icons.arrow_forward,
                onPressed: () {
                  print('중간 버튼');
                },
              ),
              const SizedBox(height: 8),
              Buttons(
                text: 'Button',
                size: ButtonSize.small,
                isDisabled: true,
                onPressed: () {
                  print('작은 버튼');
                },
              ),
              const SizedBox(height: 8),
              Buttons(
                text: 'Button',
                size: ButtonSize.small,
                onPressed: () {
                  print('작은 버튼');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

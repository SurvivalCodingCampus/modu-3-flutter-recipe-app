import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/example_screen/button_example_screen.dart';
import 'package:recipe_app/presentation/component/example_screen/color_example_screen.dart';
import 'package:recipe_app/presentation/component/example_screen/input_field_example_screen.dart';
import 'package:recipe_app/presentation/component/example_screen/tabs_example_screen.dart';
import 'package:recipe_app/presentation/component/example_screen/text_style_example_screen.dart';
import 'package:recipe_app/ui/text_styles.dart';

class PreviewMain extends StatelessWidget {
  const PreviewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text('📍Button 모음', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ButtonExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('📍InputField 모음', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputFieldExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('📍Tab', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabsExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                '📍AppTextStyle 모음',
                style: AppTextStyles.largeBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextStyleExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('📍ColorStyle 모음', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorExampleScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/search_zone.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchTap;
  const HomeScreen({super.key, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _ProfileLine(),
                const SizedBox(height: 30),
                SearchZone(
                  isMain: true,
                  onChange: (String value) {},
                  onSettingsClick: onSearchTap,
                  onTap: onSearchTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileLine extends StatelessWidget {
  const _ProfileLine();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello Jega', style: AppTextStyles.largeBold),
              Text(
                'What are you cooking today?',
                style: AppTextStyles.smallRegular.copyWith(
                  color: ColorStyle.gray3,
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 50,
            color: ColorStyle.secondary40,
            child: Image.asset('assets/images/drake.png'),
          ),
        ),
      ],
    );
  }
}

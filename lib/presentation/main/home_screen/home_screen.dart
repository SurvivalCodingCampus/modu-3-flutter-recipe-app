import 'package:flutter/material.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: AppTextStyles.normalBold.copyWith(color: ColorStyle.primary100),
      ),
    );
  }
}

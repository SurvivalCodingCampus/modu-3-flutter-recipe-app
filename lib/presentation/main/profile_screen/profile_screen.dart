import 'package:flutter/material.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: AppTextStyles.normalBold.copyWith(color: ColorStyle.primary100),
      ),
    );
  }
}

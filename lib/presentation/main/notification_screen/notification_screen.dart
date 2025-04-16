import 'package:flutter/material.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notification Screen',
        style: AppTextStyles.normalBold.copyWith(color: ColorStyle.primary100),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class AddFabScreen extends StatelessWidget {
  const AddFabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Add Screen',
        style: AppTextStyles.normalBold.copyWith(color: ColorStyle.primary100),
      ),
    );
  }
}

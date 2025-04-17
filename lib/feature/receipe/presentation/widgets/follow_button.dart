import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class FollowButton extends StatelessWidget {
  final VoidCallback onTap;
  const FollowButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 85,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primary100,
        ),
        child: Center(
          child: Text(
            'Follow',
            style: AppTextStyle.smallRegular.copyWith(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}

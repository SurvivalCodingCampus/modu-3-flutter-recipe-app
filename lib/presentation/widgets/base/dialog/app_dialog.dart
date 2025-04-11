// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';

import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String btnText;
  final Widget? innerWidget;
  final String? btnLeftText;
  final VoidCallback? onBtnClicked;
  final VoidCallback? onBtnLeftClicked;
  final double? width;
  const AppDialog({
    required this.title,
    required this.btnText,
    this.innerWidget,
    this.btnLeftText,
    this.onBtnClicked,
    this.onBtnLeftClicked,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: AppTextStyle.mediumRegular),
            SizedBox(height: 4),

            // inner widget
            if (innerWidget != null) innerWidget!,

            // two button
            if (btnLeftText != null && onBtnLeftClicked != null)
              Row(
                children: [
                  AppButton(text: btnText, onClick: onBtnClicked),
                  AppButton(text: btnLeftText!, onClick: onBtnLeftClicked),
                ],
              ),

            // one button
            if (btnLeftText == null || onBtnLeftClicked == null)
              AppButton(
                text: 'Send',
                onClick: onBtnClicked,
                type: ButtonType.small,
                bgColor: AppColor.rating,
              ),
          ],
        ),
      ),
    );
  }
}

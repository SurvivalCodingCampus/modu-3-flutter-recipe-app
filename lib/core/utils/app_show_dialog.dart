import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/presentation/widgets/base/dialog/app_dialog.dart';

class AppShowDialog {
  static void ratingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        int starCount = 0;
        return StatefulBuilder(
          builder: (statefulContext, setState) {
            return AppDialog(
              title: 'Rate recipe',
              btnText: 'Send',
              innerWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          starCount = index + 1;
                        });
                      },
                      icon: Icon(
                        index < starCount ? Icons.star : Icons.star_outline,
                        size: 30,
                        color: AppColor.rating,
                      ),
                    );
                  }),
                ],
              ),
              onBtnClicked:
                  starCount == 0
                      ? null
                      : () {
                        Navigator.of(context).pop();
                      },
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class AnnounceLine extends StatelessWidget {
  final String text;
  const AnnounceLine(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90, right: 90, top: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: ColorStyles.gray4)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyles.smallerBold.copyWith(color: ColorStyles.gray4),
            ),
          ),
          Expanded(child: Divider(thickness: 1, color: ColorStyles.gray4)),
        ],
      ),
    );
  }
}

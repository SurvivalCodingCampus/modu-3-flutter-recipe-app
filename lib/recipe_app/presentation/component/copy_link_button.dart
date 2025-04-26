import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class CopyLinkButton extends StatelessWidget {
  const CopyLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recipe Link', style: TextStyles.largeTextBold),
            SizedBox(height: 15),
            Text(
              'Copy recipe link and share your recipe link with friends and family.',
              style: TextStyles.smallerTextRegular.copyWith(
                color: ColorStyles.gray2,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.gray4,
                borderRadius: BorderRadius.all(Radius.circular(9)),
              ),
              child: Text('링크'),
            ),
          ],
        ),
      ),
    );
  }
}

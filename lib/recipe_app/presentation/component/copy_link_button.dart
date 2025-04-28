import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class CopyLinkButton extends StatelessWidget {
  final Recipe recipe;
  final String link;
  final VoidCallback copyLink;

  const CopyLinkButton({
    super.key,
    required this.recipe,
    required this.link,
    required this.copyLink,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recipe Link', style: TextStyles.largeTextBold),
            SizedBox(height: 15),
            Text(
              'Copy recipe link and share your recipe link with friends and family.',
              maxLines: 2,
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
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      link,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorStyles.primary100,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        copyLink();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('링크가 복사되었습니다!')));
                      },
                      child: Text(
                        'Copy Link',
                        style: TextStyles.smallerTextBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

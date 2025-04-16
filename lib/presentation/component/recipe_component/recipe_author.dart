import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';

class RecipeAuthor extends StatelessWidget {
  final String authorName;
  final String location;
  final String path;
  final VoidCallback? onFollowTap;

  const RecipeAuthor({
    super.key,
    required this.authorName,
    required this.location,
    required this.path,
    this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: SizedBox(
                width: 40,
                height: 40,
                child: AppImage(path: path),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: AppTextStyles.normalBold(
                    color: ColorStyle.labelColour,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: ColorStyle.primary80,
                      size: 17,
                    ),
                    Text(
                      location,
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.gray3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 85,
              child: SmallButton(title: 'Follow', onTap: onFollowTap),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // 지역 정보
      ],
    );
  }
}

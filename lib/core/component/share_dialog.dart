import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class ShareDialog extends StatelessWidget {
  final String url;
  final void Function(String link) onTab;

  const ShareDialog({super.key, required this.url, required this.onTab});

  void _showCustomSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: ColorStyle.white,
                borderRadius: BorderRadius.circular(3.63),
              ),
              child: Text(
                'Link Copied',
                style: AppTextStyles.smallRegular().copyWith(
                  color: ColorStyle.label,
                ),
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: ColorStyle.gray2, size: 10),
                ),
              ],
            ),
            Text('Recipe Link', style: AppTextStyles.largeBold()),
            const SizedBox(height: 10),
            Text(
              'Copy recipe link and share your recipe link with friends and family.',
              style: AppTextStyles.smallRegular().copyWith(
                color: ColorStyle.gray2,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: ColorStyle.gray4,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        url,
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.label,
                        ).copyWith(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      onTab(url);
                      Navigator.pop(context);
                      _showCustomSnackBar(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: ColorStyle.primary100,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        'Copy Link',
                        style: AppTextStyles.smallBold().copyWith(
                          color: ColorStyle.white,
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

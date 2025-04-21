import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class IngredientItem extends StatelessWidget {
  final String ingredientName;
  final String ingredientImgUrl;
  final int ingredientWeight;

  const IngredientItem({
    super.key,
    required this.ingredientName,
    required this.ingredientImgUrl,
    required this.ingredientWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                ingredientImgUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error); // 이미지 로드 실패 시 대체 위젯
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(width: 16),
            Text(
              ingredientName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              '$ingredientWeight g',
              style: AppTextStyles.smallRegular(
                color: ColorStyle.gray3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

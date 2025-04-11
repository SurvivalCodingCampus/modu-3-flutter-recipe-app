import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class IngredientItem extends StatelessWidget {
  final String itemName;
  final String itemImageUrl;
  final String itemWeight;

  // 생성자 선언
  const IngredientItem({
    super.key,
    required this.itemName,
    required this.itemImageUrl,
    required this.itemWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: ColorStyle.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                itemImageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Text(
            itemName,
              style: AppTextStyles.normalBold.copyWith(
                  color: ColorStyle.black
              )
            ),
          //const Spacer(),-- 이건 중간에 추가시 유연하지 않아서 Expanded로 변경
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                itemWeight,
                style: AppTextStyles.smallRegular.copyWith(
                    color: ColorStyle.gray3
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SearchField extends StatelessWidget {
  final String placeHolder;
  final String value;
  final void Function(String changed) onValueChange;
  final VoidCallback onFilterPressed;

  const SearchField({
    super.key,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          // 검색창
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorStyle.gray4), // 테두리 색상
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.search, color: ColorStyle.gray4, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: value,
                        selection: TextSelection.collapsed(
                          offset: value.length,
                        ),
                      ),
                    ),
                    onChanged: onValueChange,
                    style: AppTextStyles.smallRegular(color: ColorStyle.black),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: placeHolder,
                      hintStyle: AppTextStyles.smallRegular(
                        color: ColorStyle.gray4,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10), // 검색창과 필터 버튼 사이 간격 추가
        GestureDetector(
          onTap: onFilterPressed,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: ColorStyle.primary100, // 필터 버튼 배경색
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.tune, // 필터 아이콘
              color: Colors.white, // 아이콘 색상
              size: 20, // 아이콘 크기
            ),
          ),
        ),
      ],
    );
  }
}

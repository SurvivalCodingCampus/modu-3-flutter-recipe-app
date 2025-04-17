import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class ColorExampleScreen extends StatelessWidget {
  const ColorExampleScreen({super.key});

  // 컬러 데이터 정의 (이름과 색상)
  final List<Map<String, dynamic>> colorList = const [
    {'label': 'Black', 'color': ColorStyle.black},
    {'label': 'Gray1', 'color': ColorStyle.gray1},
    {'label': 'Gray2', 'color': ColorStyle.gray2},
    {'label': 'Gray3', 'color': ColorStyle.gray3},
    {'label': 'Gray4', 'color': ColorStyle.gray4},
    {'label': 'White', 'color': ColorStyle.white},
    {'label': 'Primary100', 'color': ColorStyle.primary100},
    {'label': 'Primary80', 'color': ColorStyle.primary80},
    {'label': 'Primary60', 'color': ColorStyle.primary60},
    {'label': 'Primary40', 'color': ColorStyle.primary40},
    {'label': 'Primary20', 'color': ColorStyle.primary20},
    {'label': 'Secondary100', 'color': ColorStyle.secondary100},
    {'label': 'Secondary80', 'color': ColorStyle.secondary80},
    {'label': 'Secondary60', 'color': ColorStyle.secondary60},
    {'label': 'Secondary40', 'color': ColorStyle.secondary40},
    {'label': 'Secondary20', 'color': ColorStyle.secondary20},
    {'label': 'Rating', 'color': ColorStyle.rating},
    {'label': 'Warning', 'color': ColorStyle.warning},
    {'label': 'WarningLight', 'color': ColorStyle.warningLight},
    {'label': 'Success', 'color': ColorStyle.success},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('컬러 미리보기', style: AppTextStyles.largeBold())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              colorList.map((item) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2 - 24, // 2열로
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorStyle.gray4),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['label'],
                      style: AppTextStyles.normalBold(
                        color:
                            item['color'] == ColorStyle.black
                                ? ColorStyle.white
                                : ColorStyle.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

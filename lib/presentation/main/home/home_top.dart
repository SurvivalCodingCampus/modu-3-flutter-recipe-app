import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/search_input_field.dart';

import '../../../core/routing/routes.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Jega',
                      style: AppTextStyles.largeBold,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'What are you cooking today?',
                      style: AppTextStyles.smallRegular.copyWith(color: ColorStyle.gray3),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: ColorStyle.secondary40,
                  child: Image.asset(
                    'assets/images/user_image.png', // 이미지 경로
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                  child: SearchInputField(
                    searchText: '',//viewModel.state.searchKeyword,
                    focusNode: FocusNode(),
                    onValueChange: (changeValue) {
                      //viewModel.search(changeValue);
                    },
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 동작
                    context.push(Routes.searchRecipes);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorStyle.primary100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero, // 여백 제거 (선택)
                    minimumSize: Size(48, 48), // 버튼 크기 (선택)
                  ),
                  child: Image.asset(
                    'assets/icons/button_filter.png', // 이미지 경로
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_button.dart';
import 'package:recipe_app/presentation/component/image_component/app_image.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

import 'home_action.dart';
import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;

  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        _buildGreetingHeader(),
        const SizedBox(height: 20),
        _buildSearchHeader(context),
        const SizedBox(height: 20),
        _buildCategoryFilter(
          categories: state.categories,
          selectedIndex: state.selectedCategoryIndex,
          onTap: (index) => onAction(HomeAction.selectCategory(index)),
        ),
      ],
    );
  }

  Widget _buildGreetingHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // ✅ 텍스트가 길어져도 오른쪽 밀리지 않게
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, doggodking 👋',
                  style: AppTextStyles.largeBold(color: ColorStyle.black),
                ),
                const SizedBox(height: 4),
                Text(
                  '겉보기엔 멍멍이 같아도 맛은 킹갓제너럴충무공버터맛입니다.',
                  style: AppTextStyles.normalRegular(color: ColorStyle.gray2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                'assets/images/profile/doggodking.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          // 🔍 인풋 필드 (검색창처럼 보여주기만)
          Expanded(
            child: SizedBox(
              height: 40, // ✅ 검색화면과 높이 동일
              child: InputField(
                labelTitle: '',
                placeholderText: 'Search recipe',
                value: '',
                height: 40,
                inputHorizontalPadding: 10,
                iconWidget: InputField.searchIcon(),
                onValueChange: null,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.push(Routes.search); // ✅ 검색 화면 이동
                },
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // ⚙️ 필터 버튼
          GestureDetector(
            onTap: () {
              context.push(Routes.search);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ColorStyle.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: AppImage(path: 'assets/images/icons/icon_setting.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter({
    required List<String> categories,
    required int selectedIndex,
    required void Function(int) onTap,
  }) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: categories.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterButton(
                title: categories[index],
                isSelected: selectedIndex == index,
                onPressed: () => onTap(index),
              ),
            ),
      ),
    );
  }
}

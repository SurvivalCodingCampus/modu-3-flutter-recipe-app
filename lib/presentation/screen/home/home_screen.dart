import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';
import 'package:recipe_app/presentation/widget/category_selector.dart';
import 'package:recipe_app/presentation/widget/text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese', 'dessert'];
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 58),

          // 상단 프로필 & 인삿말
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Jega',
                      style: AppTextStyles.largeBold(color: ColorStyle.black1),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'What are you cooking today?',
                      style: AppTextStyles.extraSmallRegular(
                        color: ColorStyle.gray2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorStyle.secondary40,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/drake.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 검색 바 + 필터 버튼
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.push('/search');
                  },
                  child: TextFieldWidget(
                    hintText: 'Search recipe',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ColorStyle.gray2,
                    ),
                    enabled: false,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorStyle.mainGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.tune, size: 20, color: Colors.white),
                  onPressed: () {
                    // TODO: 필터 기능 구현
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ✅ 카테고리 선택 바
          CategorySelector(
            categories: categories,
            category: selectedCategory,
            onSelectCategory: (value) {
              setState(() {
                selectedCategory = value;
              });
              // TODO: 여기서 DishCard 필터링 트리거
            },
          ),

          const SizedBox(height: 20),

          // ✅ 선택된 카테고리 출력 (디버깅/예시용)
          Text(
            '선택된 카테고리: $selectedCategory',
            style: AppTextStyles.normalRegular(color: ColorStyle.gray2),
          ),

          // TODO: 여기에 DishCard 위젯 나열
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/recipe_category_selector.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/state/home_state.dart';

class HomeScreen extends StatelessWidget {
  final HomeState state;
  final Function(Category category) onCategorySelected;

  const HomeScreen({
    super.key,
    required this.state,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 사용자 정보 섹션
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state.user != null) ...[
                              Text(
                                state.user!.userId,
                                style: AppTextStyles.largeBold(
                                  color: ColorStyle.black,
                                ),
                              ),
                              const Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorStyle.black,
                                ),
                              ),
                            ],
                          ],
                        ),
                        // 프로필 이미지 처리
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorStyle.gray4,
                            image: DecorationImage(
                              image:
                                  (state.user != null &&
                                          state.user!.imageUrl != null)
                                      ? (state.user!.imageUrl!.startsWith(
                                            'http',
                                          )
                                          ? NetworkImage(state.user!.imageUrl!)
                                          : AssetImage(state.user!.imageUrl!)
                                              as ImageProvider)
                                      : const AssetImage(
                                        'assets/images/default_profile.png',
                                      ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 검색창 섹션
                    GestureDetector(
                      onTap: () => context.push(Routes.search),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: ColorStyle.gray4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.search,
                                    color: ColorStyle.gray4,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Search Recipe',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorStyle.gray4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: ColorStyle.primary100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            RecipeCategorySelector(
              onCategorySelected: onCategorySelected,
              selectedCategory: state.category!,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/widget/text_field_widget.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 58),
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
                    // TODO: 필터 동작 연결
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

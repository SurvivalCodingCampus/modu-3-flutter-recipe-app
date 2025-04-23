import 'package:flutter/material.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/data/util/time_enum.dart';
import 'package:recipe_app/presentation/components/big_button.dart';
import 'package:recipe_app/presentation/components/filter_button.dart';
import 'package:recipe_app/presentation/components/medium_button.dart';
import 'package:recipe_app/presentation/components/rating_button.dart';
import 'package:recipe_app/presentation/components/small_button.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('버튼 컴포넌트')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Text(
                    "Big, Medium, Small Buttons",
                    style: TextStyles.largeTextRegular,
                  ),
                  SizedBox(height: 12),
                  BigButton(
                    name: 'Big Button',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      print('나는 빅버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  MediumButton(
                    name: 'Button',
                    color: ColorStyles.primary100,
                    icon: Icons.arrow_forward,
                    onClick: () {
                      print('나는 미디움버튼');
                    },
                  ),
                  SizedBox(height: 12),
                  SmallButton(
                    name: 'Small Button',
                    color: ColorStyles.primary100,

                    onClick: () {
                      print('나는 스몰버튼');
                    },
                  ),
                  SizedBox(height: 24),
                  Text("Rating Button", style: TextStyles.largeTextRegular),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(5, (index) {
                      return RatingButton(
                        rate: '${index + 1}',
                        color: ColorStyles.primary100,
                        ontap: () {
                          print('레이팅 ${index + 1} 버튼 클릭');
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 24),
                  Text("Filter Button", style: TextStyles.largeTextRegular),
                  SizedBox(height: 12),
                  Text('Time'),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        Time.values
                            .map(
                              (e) => FilterButton(
                                value: e,
                                color: ColorStyles.primary100,
                                ontap: () {
                                  print('${e.name} 필터 선택됨');
                                },
                              ),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 12),
                  Text('Categorys'),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        Categories.values
                            .map(
                              (e) => FilterButton(
                                value: e,
                                color: ColorStyles.primary100,
                                ontap: () {},
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/ui/color_style.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('레이팅 다이얼로그')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  RatingDialog(
                    title: 'Rate recipe',
                    actionName: 'Send',
                    onChange: (int rate) {
                      print('별점 $rate점을 주었습니다.');
                    },
                    onButtonTap: () {
                      print("버튼을 클릭했습니다.");
                    },
                  ),
                  SizedBox(height: 12),
                  RatingDialog(
                    title: 'Rate recipe',
                    actionName: 'Send',
                    onChange: (int rate) {
                      print('별점 $rate점을 주었습니다.');
                    },
                    onButtonTap: () {
                      print("버튼을 클릭했습니다.");
                    },
                  ),
                  SizedBox(height: 12),
                  RatingDialog(
                    title: 'Rate recipe',
                    actionName: 'Send',
                    onChange: (int rate) {
                      print('별점 $rate점을 주었습니다.');
                    },
                    onButtonTap: () {
                      print("버튼을 클릭했습니다.");
                    },
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

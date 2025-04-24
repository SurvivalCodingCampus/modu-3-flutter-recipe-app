import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/components/rating_dialog.dart';
import 'package:recipe_app/presentation/components/small_button.dart';
import 'package:recipe_app/ui/color_style.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('레이팅 다이얼로그')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  RatingDialog(
                    title: 'Rate recipe',
                    actionName: 'Send',
                    onChange: (int rate) {
                      print('별점 $rate점을 주었습니다.');
                    },
                  ),
                  const SizedBox(height: 12),
                  RatingDialog(
                    title: 'Rate recipe',
                    actionName: 'Send',
                    onChange: (int rate) {
                      print('별점 $rate점을 주었습니다.');
                    },
                  ),
                  const SizedBox(height: 12),
                  RatingDialog(
                    title: 'Rate recipe',
                    actionName: 'Send',
                    onChange: (int rate) {
                      print('별점 $rate점을 주었습니다.');
                    },
                  ),
                  const SizedBox(height: 12),

                  SmallButton(
                    name: 'Alert Dialog',
                    onClick: () async {
                      return await showDialog(
                        context: context,
                        builder: (context) {
                          return RatingDialog(
                            title: '별점 주기',
                            actionName: '결정!',
                            onChange: (p0) {
                              print('결정한 별점 : $p0');
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                    color: ColorStyles.warning1,
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

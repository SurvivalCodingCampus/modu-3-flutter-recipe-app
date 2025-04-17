import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/rating_dialog.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class RatingDialogExampleScreen extends StatelessWidget {
  const RatingDialogExampleScreen({super.key});

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RatingDialog(
          title: 'Rating recipe',
          buttonTitle: 'Send',
          onChange: (int rating) {
            print('선택한 별점: $rating');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RatingDialog 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showRatingDialog(context),
          child: Text('👉눌러주세요👈', style: AppTextStyles.smallBold()),
        ),
      ),
    );
  }
}

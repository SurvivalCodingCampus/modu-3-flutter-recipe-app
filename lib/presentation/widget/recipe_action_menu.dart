import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:recipe_app/presentation/widget/score_dialog.dart';

class RecipeActionMenu extends StatelessWidget {
  const RecipeActionMenu({super.key});

  void _showScoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            insetPadding: const EdgeInsets.symmetric(horizontal: 32),
            child: ScoreDialog(
              title: 'Rate recipe',
              actionName: 'Send',
              onChange: (score) {
                Navigator.of(context).pop();
                print('⭐ 받은 별점: $score');
              },
            ),
          ),
    );
  }

  Future<void> _showActionSheet(BuildContext context) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: 'Actions',
      actions: [
        const SheetAction(icon: Icons.share, label: 'Share', key: 'share'),
        const SheetAction(icon: Icons.star, label: 'Rate Recipe', key: 'rate'),
        const SheetAction(icon: Icons.comment, label: 'Review', key: 'review'),
        const SheetAction(
          icon: Icons.bookmark_remove,
          label: 'Unsave',
          key: 'unsave',
        ),
      ],
    );

    switch (result) {
      case 'rate':
        _showScoreDialog(context);
        break;
      case 'share':
        // TODO: 공유 기능 구현
        break;
      case 'review':
        // TODO: 리뷰 기능 구현
        break;
      case 'unsave':
        // TODO: 저장 해제 기능 구현
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () => _showActionSheet(context),
    );
  }
}

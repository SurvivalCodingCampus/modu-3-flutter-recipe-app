import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

class IngredientPopupMenuButton extends StatelessWidget {
  const IngredientPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ColorStyles.white,
      iconSize: 24,
      surfaceTintColor: ColorStyles.black,
      onSelected: (value) {},
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: 'share',
            child: Row(
              spacing: 16,
              children: [Icon(Icons.share), Text('Share')],
            ),
          ),
          PopupMenuItem(
            value: 'rate',
            child: Row(
              spacing: 16,
              children: [Icon(Icons.star), Text('Rate Recipe')],
            ),
          ),
          PopupMenuItem(
            value: 'review',
            child: Row(
              spacing: 16,
              children: [Icon(Icons.chat), Text('Review')],
            ),
          ),
          PopupMenuItem(
            value: 'unsave',
            child: Row(
              spacing: 16,
              children: [Icon(Icons.bookmark), Text('Unsave')],
            ),
          ),
        ];
      },
      offset: const Offset(0, 20),
      child: Container(
        height: 24,
        width: 24,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.more_horiz),
      ),
    );
  }
}

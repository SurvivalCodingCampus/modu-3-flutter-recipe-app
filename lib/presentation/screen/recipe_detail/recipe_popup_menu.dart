import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

enum PopupItem { share, rateRecipe, review, unsave }

class RecipePopupMenu extends StatelessWidget {
  final int recipeId;
  final void Function(PopupItem item) onTabMenu;

  const RecipePopupMenu({
    super.key,
    required this.recipeId,
    required this.onTabMenu,
  });

  void showPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // 배경 클릭시 창 닫기 허용
      barrierColor: Colors.black.withValues(alpha: 0.5), // 배경 어둡게 설정
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency, // 배경을 투명하게 설정
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Positioned(
                top: 20, // 팝업 메뉴 위치: 상단으로 조정 (이미지와 유사하게)
                right: 24,
                child: _buildPopupMenu(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPopupMenu(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: ColorStyle.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // 그림자 표현
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPopupMenuItem(
              icon: Icons.share,
              text: 'Share',
              onTap: () {
                onTabMenu(PopupItem.share);
              },
            ),

            _buildPopupMenuItem(
              icon: Icons.star,
              text: 'Rate Recipe',
              onTap: () {
                onTabMenu(PopupItem.rateRecipe);
              },
            ),
            _buildPopupMenuItem(
              icon: Icons.comment,
              text: 'Review',
              onTap: () {
                onTabMenu(PopupItem.review);
              },
            ),

            _buildPopupMenuItem(
              icon: Icons.bookmark,
              text: 'Unsave',
              iconColor: ColorStyle.label,
              onTap: () {
                onTabMenu(PopupItem.unsave);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupMenuItem({
    required IconData icon,
    required String text,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? ColorStyle.label),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyles.smallRegular(color: ColorStyle.label),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 배경을 투명하게 설정
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            top: 20, // 팝업 메뉴 위치: 상단으로 조정 (이미지와 유사하게)
            right: 24,
            child: _buildPopupMenu(context),
          ),
        ],
      ),
    );
  }
}

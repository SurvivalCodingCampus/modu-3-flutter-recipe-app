import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

import '../../data/model/recipe.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final bool showTimerAndBookmark;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.showTimerAndBookmark,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool _bookMark = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _bookMark = !_bookMark;
        });
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(widget.recipe.imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                //transparent = 투명한 색
                colors: [Colors.transparent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            right: 6,
            top: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
              child: Container(
                width: 37,
                height: 16,
                decoration: BoxDecoration(
                  color: ColorStyles2.secondary20,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: ColorStyles2.rating, size: 7.5),
                      SizedBox(width: 2),
                      Text(
                        widget.recipe.rate.toStringAsFixed(1),
                        style: TextStyles2.rateText.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 15,
            right: widget.showTimerAndBookmark ? 180 : 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.recipe.title,
                  style:
                      widget.showTimerAndBookmark
                          ? TextStyles2.menuIntroduceText
                          : TextStyles2.menuIntroduceText.copyWith(
                            fontSize: 11,
                          ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Text(
                  'By ${widget.recipe.chef}',
                  style:
                      widget.showTimerAndBookmark
                          ? TextStyles2.chefNameText
                          : TextStyles2.chefNameText.copyWith(fontSize: 8),
                ),
              ],
            ),
          ),
          if (widget.showTimerAndBookmark)
            Positioned(
              right: 12,
              bottom: 10,
              child: Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: ColorStyles2.chefName,
                    size: 17,
                  ),
                  SizedBox(width: 3),
                  Text.rich(
                    TextSpan(
                      text: widget.recipe.minutes.toString(),
                      style: TextStyles2.cookingTimeText,
                      children: [
                        TextSpan(
                          text: ' min',
                          style: TextStyles2.cookingTimeText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 24,
                    height: 24,
                    child: Icon(
                      _bookMark ? Icons.bookmark : Icons.bookmark_border,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

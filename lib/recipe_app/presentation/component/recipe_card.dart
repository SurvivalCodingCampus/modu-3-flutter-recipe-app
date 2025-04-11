import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/model/recipe.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

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
            right: 12,
            top: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
              child: Container(
                width: 37,
                height: 16,
                decoration: BoxDecoration(
                  color: ColorStyles2.starRateContainerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorStyles2.starColor,
                        size: 7.5,
                      ),
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
            child: Text.rich(
              TextSpan(
                text: widget.recipe.title,
                style: TextStyles2.menuIntroduceText,
                children: [
                  TextSpan(
                    text: 'By ${widget.recipe.chef}',
                    style: TextStyles2.chefNameText,
                  ),
                ],
              ),
            ),
          ),
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

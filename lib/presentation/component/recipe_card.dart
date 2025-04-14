import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeCard extends StatefulWidget {
  static const String _timerIcon = "assets/icons/timer.png";
  static const String _bookmarkIcon = "assets/icons/bookmark.png";

  final String imagePath;
  final String author;
  final String title;
  final int rating;
  final int cookTime;
  final VoidCallback onBookmark;

  const RecipeCard({
    super.key,
    required this.imagePath,
    required this.author,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.onBookmark,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorStyles.black,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorStyles.black.withAlpha(10),
                ColorStyles.black.withAlpha(255),
              ],
            ),
          ),
        ),
        _buildRating(),
        _buildTitle(),
        _buildAuthor(),
        _buildCookTime(),
        _buildBookMarkButton(),
      ],
    );
  }

  Widget _buildRating() {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        decoration: BoxDecoration(
          color: ColorStyles.secondary20,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          spacing: 2,
          children: [
            const Icon(Icons.star, color: ColorStyles.rating, size: 16),
            Text(
              '${widget.rating.toDouble()}',
              style: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Positioned(
      left: 10,
      width: 170,
      bottom: 22,
      child: Text(
        widget.title,
        style: TextStyles.smallTextBold.copyWith(color: ColorStyles.white),
      ),
    );
  }

  Widget _buildAuthor() {
    return Positioned(
      left: 10,
      bottom: 10,
      child: Text(
        'By ${widget.author}',
        style: TextStyles.labelTextBold.copyWith(color: ColorStyles.white),
      ),
    );
  }

  Widget _buildCookTime() {
    return Positioned(
      right: 44,
      bottom: 10,
      child: Row(
        spacing: 5,
        children: [
          SizedBox(
            width: 17,
            height: 17,
            child: Image.asset(RecipeCard._timerIcon, color: ColorStyles.gray4),
          ),
          Text(
            '${widget.cookTime} min',
            style: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookMarkButton() => Positioned(
    right: 10,
    bottom: 10,
    child: GestureDetector(
      key: const Key('bookmark_button'),
      onTap: () {
        setState(() {
          isBookmarked = !isBookmarked;
          widget.onBookmark();
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isBookmarked ? ColorStyles.primary80 : ColorStyles.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          RecipeCard._bookmarkIcon,
          color: isBookmarked ? ColorStyles.white : ColorStyles.gray4,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class RecipeCard extends StatefulWidget {
  final String? title;
  final String imageUrl;
  final String rating;
  final String time;
  final String? name;
  final VoidCallback? bookMark;

  const RecipeCard({
    super.key,
    this.title,
    required this.imageUrl,
    required this.rating,
    required this.time,
    this.name,
    this.bookMark,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isBookmarked = false;

  void toggleBookMark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    if (widget.bookMark != null) widget.bookMark!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              widget.imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                // width: 37,
                // height: 16,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorStyles.secondary20,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: ColorStyles.rating, size: 13),
                    Text(
                      widget.rating,
                      style: TextStyles.smallRegular.copyWith(
                        color: ColorStyles.black,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 22,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? '',
                    style: TextStyles.smallBold.copyWith(
                      color: ColorStyles.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'by ${widget.name ?? ''}',
                    style: TextStyles.smallerRegular.copyWith(
                      color: ColorStyles.white,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 7,
              child: Row(
                children: [
                  Icon(Icons.access_time, color: ColorStyles.gray4, size: 17),
                  SizedBox(width: 5),
                  Text(
                    widget.time,
                    style: TextStyles.smallerRegular.copyWith(
                      color: ColorStyles.gray4,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: toggleBookMark,
                    child: ClipOval(
                      child: Container(
                        width: 24,
                        height: 24,
                        color: ColorStyles.white,
                        child: Icon(
                          isBookmarked
                              ? Icons.bookmark_border_outlined
                              : Icons.bookmark,
                          color: ColorStyles.primary80,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

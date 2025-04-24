import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class HomeCard extends StatelessWidget {
  final int id;
  final String name;
  final String imgUrl;
  final bool bookmarkStatus;
  final String time;
  final VoidCallback bookmarkTap;
  const HomeCard({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.bookmarkStatus,
    required this.time,
    required this.bookmarkTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 170,
            width: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.grey4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: AppTextStyle.smallerBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: AppTextStyle.smallRegular.copyWith(
                            color: AppColor.grey3,
                          ),
                        ),
                        Text(
                          time,
                          style: AppTextStyle.smallerBold.copyWith(
                            color: AppColor.grey2,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: bookmarkTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white,
                        ),
                        child: Icon(
                          bookmarkStatus
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color: AppColor.primary100,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 0,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

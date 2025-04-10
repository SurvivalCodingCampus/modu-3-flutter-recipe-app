import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';
import '../../../ui/text.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(child: RecipeCard()),
        backgroundColor: ColorStyles.gray1, // 배경 잘 보이게
      ),
    ),
  );
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/images/gopchangjeongol.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      height: 24,
                      child: Row(
                        children: [
                          Image.asset('assets/images/stopwatch.png',
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 4),
                          Text('20 min',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 6),
                    Image.asset(
                      'assets/images/bookmark.png',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: ColorStyles.rating, size: 10),
                      Text('4.0', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gopchang Jeongol',
                      style: TextStyles.normalTextRegular.copyWith(color: Colors.white),
                    ),
                    Text(
                      'By Bobae',
                      style: TextStyles.smallerTextRegular.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

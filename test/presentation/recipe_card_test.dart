import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('카드 확인', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RecipeCard(
          title: 'Traditional spare ribs baked',
          author: 'By Chef John',
          cookTimes: 20,
          rate: Rate(rateStar: 4),
          isTest: true,
        ),
      ),
    );

    expect(find.text('Traditional spare ribs baked'), findsOneWidget);
    expect(find.text('By Chef John'), findsOneWidget);
    expect(find.text('20 min'), findsOneWidget);
  });
}

class Rate {
  final double rateStar;

  const Rate({required this.rateStar});
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String author;
  final int cookTimes;
  final Rate rate;
  final bool isTest;

  const RecipeCard({
    super.key,
    required this.title,
    required this.author,
    required this.cookTimes,
    required this.rate,
    this.isTest = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              isTest
                  ? Container(width: 315, height: 150, color: Colors.grey[300])
                  : Image.network(
                    '',
                    width: 315,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white)),
              Text(author, style: TextStyle(color: Colors.white)),
              Text('$cookTimes min', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:recipe_app/presentation/component/button/filter_button.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> stars = ['5', '4', '3', '2', '1'];
  List<String> filters = ['All', 'Newest', 'Oldest', 'Popularity'];
  List<String> categorys = [
    'All',
    'Cereal',
    'Vegetables',
    'Dinner',
    'Chinese',
    'Local Dish',
    'Fruit',
    'BreakFast',
    'Spanish',
    'Lunch',
  ];
  Set<String> seleted = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Time', style: TextFontStyle.smallBold()),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(filters.length, (index) {
                final filter = filters[index];
                return FilterButton(
                  text: filter,
                  isSelected: seleted.contains(filter),
                  onChanged: () {
                    setState(() {
                      if (seleted.contains(filter)) {
                        seleted.remove(filter);
                        print('지우기');
                      } else {
                        seleted.add(filter);
                        print('추가');
                      }
                    });
                  },
                  starIcon: false,
                );
              }),
            ),
            SizedBox(height: 10),
            Text('Rate', style: TextFontStyle.smallBold()),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(stars.length, (index) {
                final star = stars[index];
                return FilterButton(
                  text: star,
                  isSelected: seleted.contains(star),
                  onChanged: () {
                    setState(() {
                      if (seleted.contains(star)) {
                        seleted.remove(star);
                        print('지우기');
                      } else {
                        seleted.add(star);
                        print('추가');
                      }
                    });
                  },
                  starIcon: true,
                );
              }),
            ),
            SizedBox(height: 10),
            Text('Category', style: TextFontStyle.smallBold()),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(categorys.length, (index) {
                final category = categorys[index];
                return FilterButton(
                  text: category,
                  isSelected: seleted.contains(category),
                  onChanged: () {
                    setState(() {
                      if (seleted.contains(category)) {
                        seleted.remove(category);
                        print('지우기');
                      } else {
                        seleted.add(category);
                        print('추가');
                      }
                    });
                  },
                  starIcon: false,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

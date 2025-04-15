import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

import '../component/buttons.dart';

class FilterSearchBottom extends StatelessWidget {
  const FilterSearchBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('showModalBottomSheet'),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(30, 31, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 450,
                child: Column(
                  children: [
                    Text(
                      'Filter Search',
                      style: TextStyles.smallTextBold.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 256,
                      height: 58,
                      child: Column(
                        children: [
                          Text('Time', style: TextStyles.smallerTextBold),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              RatingButton(buttons: Button(text: 'All')),
                              SizedBox(width: 10,),
                              RatingButton(buttons: Button(text: 'Newest')),
                              SizedBox(width: 10,),
                              RatingButton(buttons: Button(text: 'Oldest')),
                              SizedBox(width: 10,),
                              RatingButton(buttons: Button(text: 'Popularity')),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Text('Rate', style: TextStyles.smallerTextBold),
                    SizedBox(height: 10),
                    FilterButton(buttons: Button(text: '1')),
                    SizedBox(height: 20),
                    Text('Category', style: TextStyles.smallerTextBold),
                    SizedBox(height: 10),
                    FilterButton(buttons: Button(text: '1')),
                    SizedBox(height: 10),
                    FilterButton(buttons: Button(text: '1')),
                    SizedBox(height: 10),
                    FilterButton(buttons: Button(text: '1')),
                    SizedBox(height: 30),
                    SmallButtonsWidget(
                      onClick: () {},
                      buttons: Buttons(name: 'Filter'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

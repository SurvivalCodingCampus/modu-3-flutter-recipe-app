import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../../ui/text_styles.dart';
import '../../component/filter_small_button.dart';
import 'home_view_model.dart';

class Home extends StatefulWidget {
  final HomeViewModel viewModel;

  const Home({super.key, required this.viewModel});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('Home')),
    Center(child: Text('Saved')),
    Center(child: Text('Notifications')),
    Center(child: Text('Profile')),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 30, right: 30),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Jega',
                          style: TextStyles.largeBold.copyWith(fontSize: 20),
                        ),
                        Text(
                          'what are you cooking today?',
                          style: TextStyles.smallerRegular.copyWith(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyles.secondary40,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/men.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 45),
                        child: TextField(
                          style: TextStyles.smallerRegular.copyWith(
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: 'Search recipe',
                            hintStyle: TextStyles.smallerRegular.copyWith(
                              color: ColorStyles.gray4,
                              fontSize: 11,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: ColorStyles.gray4,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorStyles.gray4,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorStyles.gray4),
                            ),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    FilterSmallButton(onTap: () {}),
                  ],
                ),
              ),
              // TabBars(labels: widget.viewModel.state.categoryList),
              Expanded(child: Center(child: Text('Home content'))),
            ],
          );
        },
      ),
      // bottomNavigationBar: MadeNVBar(index: _selectedIndex, onTap: _onTap),
    );
  }
}

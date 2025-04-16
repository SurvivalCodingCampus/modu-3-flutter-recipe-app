
import 'package:flutter/material.dart';

import '../../data/model/chef.dart';
import '../../ui/color.dart';
import '../../ui/text.dart';



class ChefProfile extends StatefulWidget {
  final Chef chef;

  const ChefProfile({super.key, required this.chef});

  @override
  State<ChefProfile> createState() => _ChefProfileState();
}

class _ChefProfileState extends State<ChefProfile> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
              ),
              child: Image.network(widget.chef.image),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chef.name,
                    style: TextStyles.smallerTextBold,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.place,
                          color: ColorStyles.primary40,
                        ),
                        Text(widget.chef.address,
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isClicked ? ColorStyles.gray1 : ColorStyles.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: isClicked
                ? Text('Followed',style: TextStyles.smallerTextBold.copyWith(color: Colors.black))
                : Text('Follow', style: TextStyles.smallerTextBold.copyWith(color: Colors.white),)
            ),
          ],
        ),
      ),
    );
  }
}

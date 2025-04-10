import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class RatingCard extends StatefulWidget {
  const RatingCard({super.key});
  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  List<bool> starActList = List.generate(5, (_) => false);
  int ratingInt = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorStyle.black.withValues(alpha: 0.1),
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
          BoxShadow(
            color: ColorStyle.black.withValues(alpha: 0.2),
            offset: Offset(0, 0),
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Rate recipe', style: AppTextStyles.smallRegular()),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset localPosition = box.globalToLocal(details.globalPosition);
                double dx = localPosition.dx;
                double width = box.size.width;
                if(ratingInt >= 0 && ratingInt <= starActList.length ){
                  ratingInt = (dx / width * starActList.length).clamp(0, starActList.length).ceil();
                }else{
                  ratingInt = 0;
                }

                print(ratingInt);

                if(details.delta.dx > 0 && ratingInt -1 >= 0){
                  setState(() {
                    starActList[ratingInt -1] = true;
                  });
                }else if(ratingInt -1 < 0){
                  setState(() {
                    starActList[0] = false;
                  });
                }else{
                  starActList[ratingInt -1] = false;
                }
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    starActList.map((e) {
                      return e
                          ? Icon(Icons.star, color: ColorStyle.rating, size: 40)
                          : Icon(
                            Icons.star_border,
                            color: ColorStyle.rating,
                            size: 40,
                          );
                    }).toList(),
              ),
            ),
            SizedBox(height: 10),
            Align(alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: ratingInt == 0 ? ColorStyle.gray4 : ColorStyle.rating,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                child: InkWell(
                  onTap: (){
                    if(ratingInt > 0) Navigator.of(context).pop(ratingInt);
                  },
                  borderRadius: BorderRadius.circular(6),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child:Text(
                      "Send",
                      style: AppTextStyles.normalBold(color: ColorStyle.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

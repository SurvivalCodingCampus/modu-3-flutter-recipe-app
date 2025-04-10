import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Ingredientitem(),
      ),
    )
  );
}

class Ingredientitem extends StatelessWidget {
  const Ingredientitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          height: 72,
          decoration: BoxDecoration(
            color: ColorStyles.gray4,
            borderRadius: BorderRadius.circular(20)

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Image.asset('assets/images/tomato.png',
                  width: 52,
                  height: 52,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text('Tomatos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text('500g',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

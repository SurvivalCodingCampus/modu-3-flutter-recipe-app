import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String ingredientName;
  final String ingredientImgUrl;
  final int ingredientWeight;

  const IngredientItem({
    super.key,
    required this.ingredientName,
    required this.ingredientImgUrl,
    required this.ingredientWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              ingredientImgUrl,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            ingredientName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            '$ingredientWeight g',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
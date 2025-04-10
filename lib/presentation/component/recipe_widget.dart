import 'package:flutter/material.dart';

import '../../data/model/recipe.dart';

class RecipeWidget extends StatefulWidget {
  final void Function(String name)? onTapName;
  final void Function(Recipe recipe)? onTapImageUrl;
  final void Function(Recipe recipe)? onTap;

  final Recipe recipe;

  const RecipeWidget({
    super.key,
    required this.recipe,
    this.onTapName,
    this.onTapImageUrl,
    this.onTap,
  });

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  Color _backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _backgroundColor = Colors.yellow;
          });
        },
        onTap: () {
          setState(() {
            _backgroundColor = Colors.blue;
          });
          widget.onTap?.call(widget.recipe);
        },
        child: Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.onTapName?.call(widget.recipe.name);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_forward),
                    Text(
                      widget.recipe.name,
                      style: TextStyle(fontSize: 40),
                      key: const Key('name'),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onTapImageUrl?.call(widget.recipe);
                },
                child: Text(widget.recipe.imageUrl, style: TextStyle(fontSize: 40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
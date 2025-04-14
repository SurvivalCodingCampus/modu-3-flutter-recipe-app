import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/skeleton_effect.dart';

class RecipeImageLoader extends StatefulWidget {
  final String imageUrl;

  const RecipeImageLoader({super.key, required this.imageUrl});

  @override
  State<RecipeImageLoader> createState() => _RecipeImageLoaderState();
}

class _RecipeImageLoaderState extends State<RecipeImageLoader> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (!_isLoaded) const SkeletonEffect(width: double.infinity),
        Image.network(
          widget.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              // 이미지가 로드 완료된 경우
              Future.microtask(() {
                if (!_isLoaded) {
                  setState(() => _isLoaded = true);
                }
              });
              return child;
            } else {
              return const SizedBox.shrink(); // Skeleton이 위에 있으니 비워둠
            }
          },
        ),
      ],
    );
  }
}

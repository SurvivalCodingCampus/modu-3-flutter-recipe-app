// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';

// Project imports:

class SkeletonAnimationWidget extends StatefulWidget {
  final double? width;
  final double? height;

  const SkeletonAnimationWidget({super.key, this.width, this.height});

  @override
  State<SkeletonAnimationWidget> createState() =>
      _SkeletonAnimationWidgetState();
}

class _SkeletonAnimationWidgetState extends State<SkeletonAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(color: ColorStyle.primary60),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  ColorStyle.primary100,
                  ColorStyle.primary60,
                  ColorStyle.primary80,
                ],
                stops: [
                  0.0,
                  (_animation.value + 2) / 4, // 0.0 ~ 1.0 범위로 정규화
                  1.0,
                ],
              ).createShader(bounds);
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              color: ColorStyle.primary60,
            ),
          );
        },
      ),
    );
  }
}

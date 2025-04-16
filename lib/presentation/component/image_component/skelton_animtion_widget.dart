import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';

class SkeletonAnimationWidget extends StatefulWidget {
  final Size size;

  const SkeletonAnimationWidget({super.key, required this.size});

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
    final size = widget.size;

    return AnimatedBuilder(
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
              stops: [0.0, (_animation.value + 2) / 4, 1.0],
            ).createShader(bounds);
          },
          child: Container(
            width: size.width,
            height: size.height,
            color: ColorStyle.primary60,
          ),
        );
      },
    );
  }
}

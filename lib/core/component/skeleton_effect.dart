import 'package:flutter/material.dart';

class SkeletonEffect extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const SkeletonEffect({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8.0,
  });

  @override
  State<SkeletonEffect> createState() => _SkeletonEffectState();
}

class _SkeletonEffectState extends State<SkeletonEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
              stops: [
                (_controller.value - 0.3).clamp(0.0, 1.0),
                _controller.value,
                (_controller.value + 0.3).clamp(0.0, 1.0),
              ],
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 16,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        );
      },
    );
  }
}

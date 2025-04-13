import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';

class AppImage extends StatefulWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final VoidCallback? onImageLoaded;
  final Widget Function(BuildContext context)? overlayBuilder;

  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
    this.onImageLoaded,
    this.overlayBuilder,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    final isNetwork = widget.path.startsWith('http');

    if (isNetwork) {
      return ClipRRect(
        borderRadius: widget.borderRadius,
        child: Stack(
          children: [
            Image.network(
              widget.path,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                final loaded = wasSynchronouslyLoaded || frame != null;

                if (!_loaded && loaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() => _loaded = true);
                      widget.onImageLoaded?.call();
                    }
                  });
                }
                return child;
              },
              errorBuilder: (_, __, ___) => _errorPlaceholder(),
            ),
            if (!_loaded) _skeletonAnimation(),
            if (_loaded && widget.overlayBuilder != null)
              widget.overlayBuilder!(context),
          ],
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: widget.borderRadius,
        child: Stack(
          children: [
            Image.asset(
              widget.path,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
            ),
            if (widget.overlayBuilder != null) widget.overlayBuilder!(context),
          ],
        ),
      );
    }
  }

  Widget _errorPlaceholder() => Container(
    color: ColorStyle.primary60,
    width: widget.width,
    height: widget.height,
    child: const Icon(Icons.broken_image),
  );

  Widget _skeletonAnimation() {
    return SkeletonAnimationWidget(width: widget.width, height: widget.height);
  }
}

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

import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';

class AppImage extends StatefulWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final VoidCallback? onImageLoaded;
  final Widget Function(BuildContext context)? overlayBuilder; //오버레이 넣는 위젯 부분
  final Widget Function(BuildContext context, Size size)?
  skeletonBuilder; //스켈레톤 넣는 위젯 부분

  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.onImageLoaded,
    this.overlayBuilder,
    this.skeletonBuilder,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    final isNetwork = widget.path.startsWith('http');
    final imageSize = Size(
      widget.width ?? double.infinity,
      widget.height ?? double.infinity,
    );

    return widget.borderRadius != null
        ? ClipRRect(
          borderRadius: widget.borderRadius!,
          child: isNetwork ? _buildNetworkImage(imageSize) : _buildAssetImage(),
        )
        : isNetwork
        ? _buildNetworkImage(imageSize)
        : _buildAssetImage();
  }

  Widget _buildNetworkImage(Size imageSize) {
    return Stack(
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
        if (!_loaded)
          widget.skeletonBuilder?.call(context, imageSize) ?? const SizedBox(),
        if (_loaded && widget.overlayBuilder != null)
          widget.overlayBuilder!(context),
      ],
    );
  }

  Widget _buildAssetImage() {
    return Stack(
      children: [
        Image.asset(
          widget.path,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          errorBuilder: (_, __, ___) => _errorPlaceholder(),
        ),
        if (widget.overlayBuilder != null) widget.overlayBuilder!(context),
      ],
    );
  }

  Widget _errorPlaceholder() => Container(
    color: ColorStyle.warning,
    width: widget.width,
    height: widget.height,
    child: const Icon(Icons.photo, color: ColorStyle.black),
  );
}

import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final isNetwork = path.startsWith('http');

    final image =
        isNetwork
            ? Image.network(
              path,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (_, __, ___) => _placeholder(),
            )
            : Image.asset(path, width: width, height: height, fit: fit);

    return ClipRRect(borderRadius: borderRadius, child: image);
  }

  Widget _placeholder() => Container(
    color: Colors.grey[300],
    width: width,
    height: height,
    child: const Icon(Icons.broken_image),
  );
}

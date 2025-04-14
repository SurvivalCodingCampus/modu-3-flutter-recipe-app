import 'package:flutter/material.dart';

class SkeletonCard extends StatefulWidget {
  final double? width;
  final double? height;

  const SkeletonCard({super.key, this.width, this.height});

  @override
  State<SkeletonCard> createState() => _SkeletonCardState();
}

class _SkeletonCardState extends State<SkeletonCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(); // 애니메이션이 반복으로 돌아가는 메서드
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
                (_controller.value - 0.3).clamp(0.0, 1.0), // 애니메이션 시작점
                _controller.value, // 애니메이션 진행 중
                (_controller.value + 0.3).clamp(0.0, 1.0), // 애니메이션 끝 지점
              ],
              begin: Alignment(-1.0, -0.3),
              end: Alignment(1.0, 0.3),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 120, // 기본값: 120
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width:
                            (widget.width ??
                                MediaQuery.of(context).size.width) *
                            0.5,
                        height: 14,
                        color: Colors.grey[350],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width:
                            (widget.width ??
                                MediaQuery.of(context).size.width) *
                            0.4,
                        height: 14,
                        color: Colors.grey[350],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

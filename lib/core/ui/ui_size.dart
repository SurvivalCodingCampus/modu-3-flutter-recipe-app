// Flutter imports:
import 'package:flutter/material.dart';

/// 버튼이나 카드 등 UI 요소의 반응형 너비 계산
///
/// - [ratio] 비율 (예: 0.6 = 화면의 60%)
/// - [max] 최대 너비 제한
/// - [min] 최소 너비 제한 (없으면 0)
double responsiveWidth(
  BuildContext context, {
  required double ratio,
  double? max,
  double min = 0,
}) {
  final screenWidth = MediaQuery.of(context).size.width;
  final raw = screenWidth * ratio;
  if (max != null && raw > max) return max;
  if (raw < min) return min;
  return raw;
}

/// 화면 전체에서 좌우 패딩을 제외한 너비 계산
///
/// 예: 전체 너비 - (padding * 2)
double contentWidth(BuildContext context, {double horizontalPadding = 16}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth - (horizontalPadding * 2);
}

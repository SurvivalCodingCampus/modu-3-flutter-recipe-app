import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool isBackGroundVisible,
    @Default(false) bool isOverlayVisible,
    @Default(false) bool isLogoVisible,
    @Default(false) bool isTextVisible,
    @Default(false) bool isButtonVisible,
    @Default(false) bool isInternetAvailable,
  }) = _SplashState;
}
import 'package:flutter/material.dart';

/// 앱에서 사용하는 모든 텍스트 스타일을 정의하는 클래스
/// 
class AppTextStyles {
  AppTextStyles._(); // 인스턴스 생성 방지

  // Figma에서 폰트 패밀리 이름을 가져와서 여기에 입력
  static const String fontFamily = 'Pretendard'; // 피그마에서 사용하는 폰트로 변경

  // Headings (제목)
  static TextStyle h1({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: fontWeight ?? FontWeight.w700,
      letterSpacing: -0.5,
      color: color,
    );
  }

  static TextStyle h2({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: fontWeight ?? FontWeight.w700,
      letterSpacing: -0.3,
      color: color,
    );
  }

  static TextStyle h3({
    Color? color,
    FontWeight? fontWeight,
    double? height, 
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: -0.48,
      height: height ?? 1.5,
      color: color,
    );
  } 

  // Body Text (본문)
  static TextStyle bodyLarge({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle bodyMedium({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle bodySmall({
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0,
      height: height ?? 1.5,
      color: color,
    );
  }

  // Button Text
  static TextStyle button({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 0.5,
      color: color,
    );
  }

  // Caption (작은 텍스트)
  static TextStyle caption({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: 0,
      color: color,
    );
  }
}


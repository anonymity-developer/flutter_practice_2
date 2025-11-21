import 'package:flutter/material.dart';

/// 앱에서 사용하는 모든 색상을 정의하는 클래스

class AppColors {
  AppColors._(); // 인스턴스 생성 방지

  // Primary Colors (메인 브랜드 색상)
  static const Color primary = Color(0xFF003475);

  // Social Login Colors
  static const Color kakao = Color(0xFFFEE500);
  static const Color naver = Color(0xFF03C75A);
  static const Color apple = Color(0xFF000000);

  // Secondary Colors (Gray Scale)
  static const Color secondary_color_gray_1 = Color(0xFFF3F4F6);   // 배경
  static const Color secondary_color_gray_2 = Color(0xFFDEE0E4);   // 라인
  static const Color secondary_color_gray_3 = Color(0xFFD1D5DB);   // 비활성 상태 텍스트
  static const Color secondary_color_gray_4 = Color(0xFFA4ADB7);   // 보조텍스트
  static const Color secondary_color_gray_5 = Color(0xFF818F9C);   // 보조텍스트
  static const Color secondary_color_gray_7 = Color(0xFF5A6672);   // 보조텍스트
  static const Color secondary_color_gray_10 = Color(0xFF252A30);  // 텍스트

  // 기본 색상
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color background = Color(0xFFFFFFFF);

  // Semantic Colors (상태 표시용)
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

}


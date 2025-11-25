import 'package:flutter/material.dart';

/// 앱에서 사용하는 일관된 간격(spacing)을 정의하는 클래스
/// Figma에서 사용하는 spacing 값을 여기에 적용하세요
class AppSpacing {
  AppSpacing._(); // 인스턴스 생성 방지

  // 기본 간격 단위 (보통 4px 또는 8px 단위로 사용)
  static const double baseUnit = 4.0;

  // Spacing 값들
  static const double xs = baseUnit * 1; // 4
  static const double sm = baseUnit * 2; // 8
  static const double md = baseUnit * 4; // 16
  static const double lg = baseUnit * 6; // 24
  static const double xl = baseUnit * 8; // 32
  static const double xxl = baseUnit * 12; // 48

  // 자주 사용하는 EdgeInsets
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);

  // Horizontal Padding
  static const EdgeInsets paddingHorizontalXS = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets paddingHorizontalSM = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingHorizontalXL = EdgeInsets.symmetric(horizontal: xl);

  // Vertical Padding
  static const EdgeInsets paddingVerticalXS = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets paddingVerticalSM = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets paddingVerticalXL = EdgeInsets.symmetric(vertical: xl);

  // SizedBox 간격
  static const SizedBox spaceXS = SizedBox(width: xs, height: xs);
  static const SizedBox spaceSM = SizedBox(width: sm, height: sm);
  static const SizedBox spaceMD = SizedBox(width: md, height: md);
  static const SizedBox spaceLG = SizedBox(width: lg, height: lg);
  static const SizedBox spaceXL = SizedBox(width: xl, height: xl);

  // Width only
  static const SizedBox widthXS = SizedBox(width: xs);
  static const SizedBox widthSM = SizedBox(width: sm);
  static const SizedBox widthMD = SizedBox(width: md);
  static const SizedBox widthLG = SizedBox(width: lg);
  static const SizedBox widthXL = SizedBox(width: xl);

  // Height only
  static const SizedBox heightXS = SizedBox(height: xs);
  static const SizedBox heightSM = SizedBox(height: sm);
  static const SizedBox heightMD = SizedBox(height: md);
  static const SizedBox heightLG = SizedBox(height: lg);
  static const SizedBox heightXL = SizedBox(height: xl);
}


import 'package:flutter/material.dart';

enum AppTextStyle {
  robotoBold32(
    TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32,
      letterSpacing: 0.33,
    ),
  ),
  robotoMedium16(
    TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.33,
    ),
  ),
  robotoRegular14(
    TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.33,
    ),
  ),
  robotoRegular12(
    TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.33,
    ),
  );

  final TextStyle value;

  const AppTextStyle(this.value);
}

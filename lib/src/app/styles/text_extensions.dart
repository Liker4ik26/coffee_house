import 'package:coffee_house/src/app/styles/text_style.dart';
import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle robotoBold32;
  final TextStyle robotoMedium16;
  final TextStyle robotoRegular14;
  final TextStyle robotoRegular12;

  AppTextTheme._({
    required this.robotoBold32,
    required this.robotoMedium16,
    required this.robotoRegular14,
    required this.robotoRegular12,
  });

  AppTextTheme.base()
      : robotoBold32 = AppTextStyle.robotoBold32.value,
        robotoMedium16 = AppTextStyle.robotoMedium16.value,
        robotoRegular14 = AppTextStyle.robotoRegular14.value,
        robotoRegular12 = AppTextStyle.robotoRegular12.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme._(
      robotoBold32: TextStyle.lerp(robotoBold32, other.robotoBold32, t)!,
      robotoMedium16: TextStyle.lerp(robotoMedium16, other.robotoMedium16, t)!,
      robotoRegular14:
          TextStyle.lerp(robotoRegular14, other.robotoRegular14, t)!,
      robotoRegular12:
          TextStyle.lerp(robotoRegular12, other.robotoRegular12, t)!,
    );
  }

  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? bold32,
    TextStyle? medium16,
    TextStyle? regular14,
    TextStyle? regular12,
  }) {
    return AppTextTheme._(
      robotoBold32: bold32 ?? robotoBold32,
      robotoMedium16: medium16 ?? robotoMedium16,
      robotoRegular14: regular14 ?? robotoRegular14,
      robotoRegular12: regular12 ?? robotoRegular12,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextTheme not found in $context');

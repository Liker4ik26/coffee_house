import 'package:coffee_house/src/app/styles/colors.dart';
import 'package:flutter/material.dart';


class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  AppColorsTheme.light()
      : primary = Colors.black,
        background = AppColors.snowDrift,
        secondary = Colors.white,
        accent = AppColors.halfBaked;

  AppColorsTheme.dark()
      : primary = Colors.black,
        background = AppColors.snowDrift,
        secondary = Colors.white,
        accent = AppColors.halfBaked;

  const AppColorsTheme._({
    required this.primary,
    required this.background,
    required this.secondary,
    required this.accent,
  });

  // primary is used for all text.
  final Color primary;

  // background is used for the background.
  final Color background;

  // secondary is used for secondary color of text and components.
  final Color secondary;

  // accent is used for accent components.
  final Color accent;

  @override
  ThemeExtension<AppColorsTheme> copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? secondaryColor,
    Color? accentColor,
  }) {
    return AppColorsTheme._(
      primary: primaryColor ?? primary,
      background: backgroundColor ?? background,
      secondary: secondaryColor ?? secondary,
      accent: accentColor ?? accent,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
    ThemeExtension<AppColorsTheme>? other,
    double t,
  ) {
    if (other is! AppColorsTheme) {
      return this;
    }
    return AppColorsTheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }

  static AppColorsTheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorsTheme>()!;
}

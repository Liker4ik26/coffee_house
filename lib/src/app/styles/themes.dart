import 'package:coffee_house/src/app/styles/color_extensions.dart';
import 'package:coffee_house/src/app/styles/text_extensions.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  const AppThemes._();

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: AppColorsTheme.light().background,
    ),
    extensions: <ThemeExtension<dynamic>>[
      _lightColorScheme,
      _textTheme,
    ],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.center,
      unselectedLabelColor: AppColorsTheme.light().primary,
      labelColor: AppColorsTheme.light().secondary,
      overlayColor: const MaterialStatePropertyAll<Color?>(Colors.transparent),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorsTheme.light().accent,
      ),
    ),
  );
  static final _lightColorScheme = AppColorsTheme.light();
  static final _textTheme = AppTextTheme.base();
}

import 'package:coffee_house/src/app/styles/color_extensions.dart';
import 'package:coffee_house/src/app/styles/text_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef Loc = AppLocalizations;

extension ContextExtensions on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this);

  AppColorsTheme get color => Theme.of(this).extension<AppColorsTheme>()!;

  AppTextTheme get text => Theme.of(this).extension<AppTextTheme>()!;
}

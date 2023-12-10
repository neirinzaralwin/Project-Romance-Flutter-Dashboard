import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_romance/configs/text_style/custom_text_style.dart';
import 'app_colors.dart';

final buttonStyle = ElevatedButton.styleFrom(textStyle: const TextStyle(fontFamily: mainFontName));

ThemeData customAppTheme = ThemeData(
  primarySwatch: primaryswatch,
  scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColor.primaryColor,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    elevation: 0.0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColor.secondaryColor,
    iconTheme: IconThemeData(color: AppColor.sandColor),
    actionsIconTheme: IconThemeData(color: AppColor.sandColor),
    titleTextStyle: TextStyle(
      color: AppColor.sandColor,
      fontWeight: FontWeight.w500,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColor.scaffoldBackgroundColor),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
  filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
  outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
);

final primaryswatch = MaterialColor(AppColor.swatch.value, {
  50: tintColor(AppColor.swatch, 0.9),
  100: tintColor(AppColor.swatch, 0.8),
  200: tintColor(AppColor.swatch, 0.6),
  300: tintColor(AppColor.swatch, 0.4),
  400: tintColor(AppColor.swatch, 0.2),
  500: AppColor.swatch,
  600: shadeColor(AppColor.swatch, 0.1),
  700: shadeColor(AppColor.swatch, 0.2),
  800: shadeColor(AppColor.swatch, 0.3),
  900: shadeColor(AppColor.swatch, 0.4),
});

int tintValue(int value, double factor) => max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1,
    );

int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1,
    );

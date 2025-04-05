import 'theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traveler/utils/utils.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    iconTheme: IconThemeData(
      color: ThemeConfig.blackColor,
    ),
  ),
  colorScheme: ThemeData.light().colorScheme.copyWith(
        secondary: ThemeConfig.blackColor,
        primary: ThemeConfig.primaryColor,
        onPrimary: ThemeConfig.blackColor,
        outline: ThemeConfig.borderColorLight,
        onSurface: ThemeConfig.whiteColor,
        surface: ThemeConfig.whiteColor,
        primaryContainer: ThemeConfig.whiteColor,
        onPrimaryContainer: ThemeConfig.whiteColor,
      ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: ThemeConfig.blackColor),
  scaffoldBackgroundColor: ThemeConfig.backgroundColor,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: ThemeConfig.whiteColor,
    color: ThemeConfig.primaryColor,
  ),
  primaryColor: ThemeConfig.primaryColor,
  radioTheme: RadioThemeData(
    fillColor: WidgetStateColor.resolveWith(
      (states) => ThemeConfig.blackColor,
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: const TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor041D55,
        ),
        titleSmall: TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor041D55,
        ),
        displayLarge: const TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor041D55,
        ),
        displayMedium: const TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor041D55,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: const TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor041D55,
        ),
        displaySmall: const TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor041D55,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: const TextStyle(
          fontFamily: Const.poppins,
          color: ThemeConfig.textColor636363,
        ),
      ),
);

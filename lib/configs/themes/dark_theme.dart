import 'theme_config.dart';
import 'package:flutter/material.dart';
import 'package:traveler/utils/utils.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      toolbarTextStyle: ThemeData.light().textTheme.displayMedium!.copyWith(
          fontFamily: Const.poppins,
          color: ThemeConfig.whiteColor,
          fontWeight: FontWeight.w500),
      iconTheme: const IconThemeData(
        color: ThemeConfig.blackColor,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ThemeConfig.whiteColor,
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          titleMedium: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.whiteColor,
          ),
          titleSmall: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.textColorF6F8F8,
          ),
          displayLarge: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.whiteColor,
          ),
          displayMedium: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.secondaryTextColorDark,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.textColorF6F8F8,
          ),
          displaySmall: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.textColorF6F8F8,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: const TextStyle(
            fontFamily: Const.poppins,
            color: ThemeConfig.textColorF6F8F8,
          ),
        ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) => Colors.white),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: ThemeConfig.whiteColor,
      primary: ThemeConfig.whiteColor,
      onPrimary: ThemeConfig.blackColor,
      outline: ThemeConfig.borderColorDark,
      onSurface: ThemeConfig.blackColor,
      brightness: Brightness.dark,
      surface: ThemeConfig.blackColor,
      primaryContainer: ThemeConfig.whiteColor,
      onPrimaryContainer: ThemeConfig.blackColor,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: Colors.white,
      color: ThemeConfig.primaryColor,
    ),
    primaryColor: ThemeConfig.whiteColor,
    scaffoldBackgroundColor: ThemeConfig.backgroundColorDark);

import 'theme_state.dart';
import 'package:flutter/material.dart';
import 'package:traveler/configs/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(lightTheme));

  /// Toggle manually between dark and light mode
  void toggleTheme(bool isDarkMode) {
    emit(ThemeState(isDarkMode ? darkTheme : lightTheme));
  }

  /// Automatically set the theme based on system settings
  void updateThemeFromSystem(Brightness brightness) {
    bool isDarkMode = brightness == Brightness.dark;
    emit(ThemeState(isDarkMode ? darkTheme : lightTheme));
  }
}

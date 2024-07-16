import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    ),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    //textformfield  for for all the app
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
    ),
  );
}

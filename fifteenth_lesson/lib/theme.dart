import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData();

ThemeData themeLight = _themeLight.copyWith(
    primaryColorDark: Colors.deepOrange[100],
    textTheme: _textLight(_themeLight.textTheme),
    appBarTheme: AppBarTheme(
      color: Colors.black54,
      foregroundColor: Colors.deepOrange[100],
      centerTitle: false,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.black54),
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.deepOrange[100]),
        hoverColor: Colors.black,
        iconColor: Colors.deepOrange[100],
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange[100]!),
        )),
    dialogBackgroundColor: Colors.grey,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.deepOrange[100]),
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    chipTheme: ChipThemeData(
      selectedColor: Colors.deepOrange[100],
      backgroundColor: Colors.black54,
      labelStyle: const TextStyle(color: Colors.white),
      showCheckmark: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          foregroundColor: Colors.black),
    ),
    cardColor: Colors.deepOrange[100]);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
      headline4: const TextStyle(fontSize: 24, color: Colors.black));
}

import 'package:flutter/material.dart';
import 'package:puppy_diary/style/palette.dart';
import 'package:puppy_diary/style/text_theme.dart';

ThemeData defaultTheme = ThemeData(
  textTheme: textDefaultTheme,

  scaffoldBackgroundColor: palette[Col.background],

  appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: palette[Col.background]
      ),
      centerTitle: true,
      backgroundColor: palette[Col.primary]
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: palette[Col.primary],
    selectedItemColor: palette[Col.secondary]
  ),

  cardTheme: CardTheme(
    color:  palette[Col.secondary],
  ),

);
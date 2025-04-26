import 'package:flutter/material.dart';
import 'package:puppy_diary/style/icon_theme.dart';
import 'package:puppy_diary/style/palette.dart';
import 'package:puppy_diary/style/text_theme.dart';

ThemeData defaultTheme = ThemeData(
  textTheme: textDefaultTheme,

  scaffoldBackgroundColor: palette[Col.background],

  appBarTheme: AppBarTheme(
      iconTheme: appbarIcon,
      titleTextStyle: textDefaultTheme.titleLarge,
      centerTitle: true,
      backgroundColor: palette[Col.background],

  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: palette[Col.primary],
    selectedItemColor: palette[Col.secondary]
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: palette[Col.background],
    width: 200,
  ),

  cardTheme: CardTheme(
    color:  palette[Col.secondary],
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(palette[Col.primary]),
    )
  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: palette[Col.primary],
  ),


    inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: palette[Col.primary]!, width: 2),
    ),
  ),

);

BoxDecoration defaultUADHTheme = BoxDecoration(
  color: palette[Col.secondary]
);
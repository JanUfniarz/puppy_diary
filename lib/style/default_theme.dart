import 'package:flutter/material.dart';
import 'package:puppy_diary/style/icon_theme.dart';
import 'package:puppy_diary/style/color_scheme.dart';
import 'package:puppy_diary/style/text_theme.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: colorScheme,
  textTheme: textDefaultTheme,

  appBarTheme: AppBarTheme(
      iconTheme: appbarIcon,
      titleTextStyle: textDefaultTheme.titleLarge,
      centerTitle: true,

  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: colorScheme.secondary,
    selectedItemColor: colorScheme.primary,
    unselectedItemColor: colorScheme.onPrimary,
  ),

  drawerTheme: const DrawerThemeData(
    width: 200,
  ),

  cardTheme: CardTheme(
    color:  colorScheme.secondary,
  ),

);
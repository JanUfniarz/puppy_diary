import 'package:flutter/material.dart';
import 'package:puppy_diary/ui/style/icon_theme.dart';
import 'package:puppy_diary/ui/style/color_scheme.dart';
import 'package:puppy_diary/ui/style/text_theme.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: colorScheme,
  textTheme: textDefaultTheme,

  appBarTheme: AppBarTheme(
      iconTheme: appbarIcon,
      centerTitle: true,
  ),

  drawerTheme: const DrawerThemeData(
    width: 200,
  ),

  dividerTheme: const DividerThemeData(
    thickness: 2,
  ),

  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: colorScheme.tertiary,
      foregroundColor: colorScheme.onTertiary,
    ),
  ),

  useMaterial3: true,

);
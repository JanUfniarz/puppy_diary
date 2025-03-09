import 'package:flutter/material.dart';

Map<String, Color> _palette = {
  'background': Colors.grey.shade900,
  'primary': Colors.lime.shade900,
  'text': const Color(0xC7EFEDF6)
};

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: _palette['background'],

  appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: _palette['background']
      ),
      centerTitle: true,
      backgroundColor: _palette['primary']
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _palette['primary']
  ),

  textTheme: TextTheme(
      titleLarge: TextStyle(
          color: _palette['text']
      )
  ),

);

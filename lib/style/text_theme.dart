import 'package:flutter/material.dart';
import 'package:puppy_diary/style/palette.dart';

extension Access on BuildContext {
    TextTheme get texts => Theme.of(this).textTheme;
}

TextTheme textDefaultTheme = TextTheme(

    titleMedium: TextStyle(
        color: palette[Col.primary]
    ),

    titleLarge: TextStyle(
        fontSize: 25,
        color: palette[Col.text]
    ),

    bodyLarge: TextStyle(
        color: palette[Col.text]
    ),
);

TextStyle errorLabel = TextStyle(
    color: palette[Col.error],
    fontSize: 20,
);
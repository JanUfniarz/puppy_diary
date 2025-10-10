import 'package:flutter/material.dart';
import 'package:puppy_diary/style/color_scheme.dart';

extension Access on BuildContext {
    TextTheme get texts => Theme.of(this).textTheme;
}

TextTheme textDefaultTheme = TextTheme(

    titleMedium: TextStyle(
        color: colorScheme.primary
    ),

    titleLarge: TextStyle(
        fontSize: 25,
        color: colorScheme.primary
    ),

    bodyLarge: TextStyle(
        color: colorScheme.primary
    ),
);

TextStyle errorLabel = TextStyle(
    color: colorScheme.primary,
    fontSize: 20,
);
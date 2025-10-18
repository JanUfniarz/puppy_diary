import 'package:flutter/material.dart';
import 'package:puppy_diary/ui/style/color_scheme.dart';


TextTheme textDefaultTheme = TextTheme(

    bodyLarge: const TextStyle(
        fontSize: 20,
    ),

    titleMedium: TextStyle(
        color: colorScheme.primary
    ),

    titleLarge: const TextStyle(
        fontSize: 25,
    ),
);

TextStyle errorLabel = TextStyle(
    color: colorScheme.error,
    fontSize: 20,
);

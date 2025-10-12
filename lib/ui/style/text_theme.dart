import 'package:flutter/material.dart';
import 'package:puppy_diary/ui/style/color_scheme.dart';

extension Access on BuildContext {
    TextTheme get texts => Theme.of(this).textTheme;
}

TextTheme textDefaultTheme = TextTheme(

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

TextStyle darkLabel = TextStyle(
    color: colorScheme.onPrimary,
);
import 'package:flutter/material.dart';
import 'package:puppy_diary/types/function_types.dart';

AppViewBuilder puppyView = (context, controller, data) => const Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    SizedBox(height: 40),
    CircleAvatar(
      radius: 80,
    ),
  ],
);
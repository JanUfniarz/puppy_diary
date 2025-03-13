import 'package:flutter/material.dart';
import 'package:puppy_diary/types.dart';

AppViewBuilder puppyView = (context, controller, child) => const Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    SizedBox(height: 40),
    CircleAvatar(
      radius: 80,
    ),
  ],
);
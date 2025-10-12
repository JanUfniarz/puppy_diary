import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/controllers/app_controller.dart';

typedef AppViewBuilder = Widget Function(
    BuildContext context,
    AppController controller,
);
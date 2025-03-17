import 'package:flutter/material.dart';
import 'package:puppy_diary/app_controller.dart';
import 'package:puppy_diary/types/data_types.dart';

typedef Transformer = DogData Function(
    IndividualData individualData,
    RaceData raceData,
);

typedef AppViewBuilder = Widget Function(
    BuildContext context,
    AppController controller,
    DogData? data,
);
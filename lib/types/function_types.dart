import 'package:flutter/material.dart';
import 'package:puppy_diary/app_controller.dart';
import 'package:puppy_diary/types/data_types.dart';

typedef Transformer = DogData Function(
    IndividualData dogData,
    RaceData raceData,
    GeneralData generalData
    );

typedef AppViewBuilder = Widget Function(
    BuildContext context,
    AppController controller,
    Widget? child
    );
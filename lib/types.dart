import 'package:flutter/material.dart';
import 'package:puppy_diary/app_controller.dart';

typedef IndividualData = ({int id, String name, DateTime birthday});

typedef RaceData = ();

typedef GeneralData = ();

typedef DogData = ();

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
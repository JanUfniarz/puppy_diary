import 'package:flutter/material.dart';
import 'package:puppy_diary/app_controller.dart';

typedef DogData = ({int id, String name, DateTime birthday});

typedef RaceData = ();

typedef GeneralData = ();

typedef Transformer = () Function(
    DogData dogData,
    RaceData raceData,
    GeneralData generalData
);

typedef AppViewBuilder = Widget Function(
    BuildContext context,
    AppController controller,
    Widget? child
);
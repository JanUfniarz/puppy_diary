import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy_diary/app_controller.dart';
import 'package:puppy_diary/puppy_diary.dart';
import 'package:puppy_diary/repositories/individual_repository.dart';
import 'package:puppy_diary/repositories/sqlite_repository.dart';

void main() => runApp(
  ChangeNotifierProvider<AppController>(
    create: (_) => AppController(
      (dogData, raceData, generalData) => (
      ),
      (
        individual: IndividualRepository(),
        general: GeneralRepository(),
        race: RaceRepository()
      )
    ),
    child: const PuppyDiary()
  )
);
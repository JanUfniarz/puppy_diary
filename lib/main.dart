import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puppy_diary/app_controller.dart';
import 'package:puppy_diary/puppy_diary.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/database/sqlite_repository.dart';

void main() => runApp(
  ChangeNotifierProvider<AppController>(
    create: (_) => AppController(
      (dogData, raceData) => (
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
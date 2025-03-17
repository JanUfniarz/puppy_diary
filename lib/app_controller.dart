import 'package:flutter/material.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/database/sqlite_repository.dart';
import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/types/function_types.dart';

class AppController extends ChangeNotifier {
  final Transformer _transformer;
  final ({
    IndividualRepository individual,
    RaceRepository race,
    GeneralRepository general
  }) _repo;

  DogData? data;

  AppController(this._transformer, this._repo);
}
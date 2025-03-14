import 'package:flutter/material.dart';
import 'package:puppy_diary/repositories/sqlite_repository.dart';
import 'package:puppy_diary/types.dart';

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
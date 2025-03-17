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

  AppController(this._transformer, this._repo) {
    loadData();
  }

  void loadData() => _repo.individual.getAll()
      .then((val) => data = _transformer(val[0], ()))
      .then((_) => notifyListeners());
}

Transformer mainTransformer = (ind, _) => (
  name: ind.name,
  fullName: ind.fullName,
  lastWeight: _lastWeight(ind.weightHistory),
  weightHistory: ind.weightHistory,
);

double _lastWeight(WeightList weightHistory) => weightHistory
    .reduce((x, y) => x.time.isAfter(y.time) ? x : y).weight;
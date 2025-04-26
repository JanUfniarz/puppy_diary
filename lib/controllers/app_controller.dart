import 'package:flutter/material.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/database/sqlite_repository.dart';
import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/types/function_types.dart';

class AppController extends ChangeNotifier {
  AppController._();

  static AppController? _instance;

  static AppController get instance => _instance ??= AppController._();

  void _initiate(Transformer transformer, IndividualRepository individualRepo) {
    _transformer = transformer;
    _individualRepo = individualRepo;
    loadData();
  }

  static void initiate(
      Transformer transformer,
      IndividualRepository individualRepo
  ) => instance._initiate(transformer, individualRepo);

  late final Transformer _transformer;

  late final IndividualRepository _individualRepo;
  List<DogData> data = [];

  int activeDog = 0;

  DogData? get dog => data.elementAtOrNull(activeDog);

  void loadData() => _individualRepo.getAll()
      .then((val) => data = val.map((el) => _transformer(el, ())).toList())
      .then((_) => notifyListeners());

  /// @te•st
  void test() {
    _individualRepo.insertDog((
      id: -1,
      name: "test1",
      fullName: "full name",
      birthday: DateTime(2020, 1, 4),
      eventHistory: [],
      weightHistory: [(time: DateTime.now(), weight: 5.1)],
    ));
    loadData();
  }

  void switchDog(int id) {
    activeDog = id;
    notifyListeners();
  }
}
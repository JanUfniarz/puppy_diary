import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/database/individual_repository.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';

class AppController extends ChangeNotifier {
  AppController._();

  static AppController? _instance;

  static AppController get instance => _instance ??= AppController._();

  static void initiate(
      IndividualRepository individualRepo
  ) => instance._initiate(individualRepo);

  void _initiate(IndividualRepository individualRepo) {
    this.individualRepo = individualRepo;
    loadData();
  }

  late final IndividualRepository individualRepo;

  List<IndividualData> data = [];

  int activeDogID = 0;

  IndividualData? get dog => data.elementAtOrNull(activeDogID);

  void updateState(void Function() callback) {
    callback();
    notifyListeners();
  }

  void loadData() => individualRepo.getAll()
      .then((val) => data = val)
      .then((_) => notifyListeners());

  // @test
  void test() {
    individualRepo.insertDog((
      id: -1,
      name: "test1",
      fullName: "full name",
      birthday: DateTime(2020, 1, 4),
      eventHistory: [],
      weightHistory: [(time: DateTime.now(), weight: 5.1)],
    ));
    loadData();
  }
}
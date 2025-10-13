import 'package:flutter/material.dart';
import 'package:puppy_diary/logic/database/individual_repository.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';
import 'package:puppy_diary/types/data_types/utility_types.dart';

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

  int activeDogIndex = 0;

  IndividualData? get dog => data.elementAtOrNull(activeDogIndex);


  void updateState(void Function() callback) {
    callback();
    notifyListeners();
  }


  void loadData() => individualRepo.getAll()
      .then((val) => data = val)
      .then((_) => notifyListeners());


  // ? test
  void test() {
    print(dog!.eventHistory);
  }


  void addEvent(AddEventViewResult val) => individualRepo.insertEvent(
      dog!.id,
      (
        time: val.time,
        done: false,
        type: val.type,
        note: val.note,
      )
  ).then((_) => loadData());
}
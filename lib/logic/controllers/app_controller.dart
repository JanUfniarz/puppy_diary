import 'package:flutter/material.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/types/data_types/view_results.dart';
import 'package:puppy_diary/types/entities/dog.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/types/entities/weight.dart';

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

  List<Dog> data = [];

  int activeDogIndex = 0;

  Dog? get dog => data.elementAtOrNull(activeDogIndex);


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


  void addEvent(AddEventVR val) => individualRepo.insertEvent(
      dog!.id,
      Event(
        time: val.time,
        type: val.type,
        note: val.note,
      )
  ).then((_) => loadData());


  void update(object) => switch (object) {
    Dog dog => individualRepo.updateDog(dog),
    Weight weight => individualRepo.updateWeight(weight, dog!.id),
    Event event => individualRepo.updateEvent(event, dog!.id),
    _ => throw Exception("Type not supported")
  };


  void delete(object) => switch (object) {
    Dog dog => individualRepo.deleteDog(dog.id),
    Weight weight => individualRepo.deleteWeight(weight.id),
    Event event => individualRepo.deleteEvent(event.id),
    _ => throw Exception("Type not supported")
  };
}
import 'package:flutter/material.dart';
import 'package:puppy_diary/database/individual_repository.dart';
import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/types/function_types.dart';

class AppController extends ChangeNotifier {
  AppController._();

  static AppController? _instance;

  static AppController get instance => _instance ??= AppController._();

  static void initiate(
      Transformer transformer,
      IndividualRepository individualRepo
  ) => instance._initiate(transformer, individualRepo);

  void _initiate(Transformer transformer, IndividualRepository individualRepo) {
    this.transformer = transformer;
    this.individualRepo = individualRepo;
    loadData();
  }

  late final Transformer transformer;

  late final IndividualRepository individualRepo;

  List<DogData> data = [];
  int activeDog = 0;

  DogData? get dog => data.elementAtOrNull(activeDog);

  void updateState(void Function() callback) {
    callback();
    notifyListeners();
  }

  void loadData() => individualRepo.getAll()
      .then((val) => data = val.map((el) => transformer(el, ())).toList())
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
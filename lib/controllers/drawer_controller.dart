import 'package:flutter/material.dart';
import 'package:puppy_diary/controllers/app_controller.dart';
import 'package:puppy_diary/views/push_views/add_dog.dart';
import 'package:puppy_diary/views/views.dart';

import '../types/data_types.dart';

typedef DrawerData = ({
  ({String? name, String? fullName}) active,
  List<({String name, int id})> rest
});

extension DrawerController on AppController {
  DrawerData get drawerData {
    var rest = (List<DogData>.from(data))
        .map((el) => (
          name: el.name,
          id: el.id
        ))
        .toList();
    if (rest.isNotEmpty) rest.removeAt(activeDog);

    return (
      active: (name: dog?.name, fullName: dog?.fullName),
      rest: rest
    );
  }

  void switchDog(int id) => updateState(() => activeDog = id);

  void addDog(BuildContext context) => pushView<IndividualData>(
    context, (context) => AddDogView(
      onSave: (name, fullName, birthDate) {
        Navigator.pop(context, (
          id: -1,
          name: name,
          fullName: fullName,
          birthday: birthDate,
          weightHistory: <Weight>[],
          eventHistory: <Event>[],
        ));
      },
    )
  ).then((individual) => individualRepo.insertDog(individual!))
   .then((individual) {
     activeDog = individual.id;
     loadData();
  });
}
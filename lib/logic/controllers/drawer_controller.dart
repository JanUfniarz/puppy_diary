import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';
import 'package:puppy_diary/types/data_types/utility_types.dart';

extension DrawerController on AppController {
  DrawerData get drawerData {
    var rest = (List<IndividualData>.from(data))
        .map((el) => (
          name: el.name,
          id: el.id
        ))
        .toList();
    if (rest.isNotEmpty) rest.removeAt(activeDogID);

    return (
      active: (name: dog?.name, fullName: dog?.fullName),
      rest: rest
    );
  }

  void switchDog(int id) => updateState(() => activeDogID = id);

  void addDog(AddDogViewResult res) =>  individualRepo.insertDog(
      (
        id: -1,
        name: res.name,
        fullName: res.fullName,
        birthday: res.birthDate,
        weightHistory: <Weight>[],
        eventHistory: <Event>[],
      )
  ).then((individual) {
     activeDogID = individual.id;
     loadData();
  });
}
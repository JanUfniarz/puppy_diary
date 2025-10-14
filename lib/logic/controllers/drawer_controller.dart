import 'package:puppy_diary/logic/controllers/app_controller.dart';
import 'package:puppy_diary/types/data_types/view_results.dart';
import 'package:puppy_diary/types/data_types/widgets_data.dart';
import 'package:puppy_diary/types/entities/dog.dart';

extension DrawerController on AppController {
  DrawerData get drawerData {
    var rest = (List<Dog>.from(data))
        .map((el) => (
          name: el.name,
          id: el.id
        ))
        .toList();
    if (rest.isNotEmpty) rest.removeAt(activeDogIndex);

    return (
      active: (name: dog?.name, fullName: dog?.fullName),
      rest: rest
    );
  }

  void switchDog(int id) => updateState(
          () => activeDogIndex = data.indexWhere((dog) => dog.id == id)
  );

  void addDog(AddDogVR res) =>  individualRepo.insertDog(
      Dog(
        name: res.name,
        fullName: res.fullName,
        birthday: res.birthDate,
      )
  ).then((_) {
     activeDogIndex = data.length;
     loadData();
  });
}
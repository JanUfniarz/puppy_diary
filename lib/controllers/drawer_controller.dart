import 'package:puppy_diary/controllers/app_controller.dart';

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
}
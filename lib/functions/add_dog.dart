import 'package:flutter/material.dart';
import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/views/add_dog.dart';

Future<IndividualData> Function(BuildContext) newDog = (
    BuildContext context
) async => await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => AddDogView(
      onSave: (name, fullName, birthDate) {
        Navigator.pop<IndividualData>(context, (
          id: -1,
          name: name,
          fullName: fullName,
          birthday: birthDate,
          weightHistory: [],
          eventHistory: [],
        ));
      },
    ),
  ),
);
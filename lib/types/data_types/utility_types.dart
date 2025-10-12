import 'package:flutter/material.dart';
import 'package:puppy_diary/types/enums/event_type.dart';

typedef AddDogViewResult = ({
  String name,
  String fullName,
  DateTime birthDate
});

typedef AddEventViewResult = ({
  EventType type,
  DateTime time,
  String note
});

typedef DrawerData = ({
  ({String? name, String? fullName}) active,
  List<({String name, int id})> rest
});

typedef TextFieldData = ({
  String label,
  void Function(String) onChanged
});

typedef InputData = ({
  String label,
  Widget child
});
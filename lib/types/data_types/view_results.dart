import 'package:puppy_diary/types/enums/event_type.dart';

typedef AddDogVR = ({
  String name,
  String fullName,
  DateTime birthDate
});


typedef AddEventVR = ({
  EventType type,
  DateTime time,
  String note
});
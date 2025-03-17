import 'package:puppy_diary/types/enums.dart';

typedef RawObject = Map<String, dynamic>;
typedef RawList = List<RawObject>;

typedef RawData = ({
  RawObject dog,
  RawList eventHistory,
  RawList weightHistory
});

typedef IndividualData = ({
  int id,
  String name,
  String fullName,
  DateTime birthday,
  List<({DateTime time, double weight})> weightHistory,
  List<Event> eventHistory,
});

typedef RaceData = ();

typedef DogData = ();

typedef Event = ({
  DateTime time,
  bool done,
  EventType type,
});
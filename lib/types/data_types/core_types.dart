import 'package:puppy_diary/types/enums/event_type.dart';

typedef RawObject = Map<String, dynamic>;
typedef RawList = List<RawObject>;

typedef RawData = ({
  RawObject dog,
  RawList eventHistory,
  RawList weightHistory
});

typedef Weight = ({
  int id,
  DateTime time,
  double weight
});

typedef Dog = ({
  int id,
  String name,
  String fullName,
  DateTime birthday,
  List<Weight> weightHistory,
  List<Event> eventHistory,
});

typedef RaceData = ();

typedef Event = ({
  int id,
  DateTime time,
  bool done,
  EventType type,
  String note,
});
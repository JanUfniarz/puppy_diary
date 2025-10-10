import 'package:puppy_diary/types/enums.dart';

typedef RawObject = Map<String, dynamic>;
typedef RawList = List<RawObject>;

typedef RawData = ({
  RawObject dog,
  RawList eventHistory,
  RawList weightHistory
});

typedef Weight = ({DateTime time, double weight});

typedef IndividualData = ({
  int id,
  String name,
  String fullName,
  DateTime birthday,
  List<Weight> weightHistory,
  List<Event> eventHistory,
});

typedef RaceData = ();

typedef DogData = ({
  int id,
  String name,
  String fullName,
  double? lastWeight,
  List<Weight> weightHistory,
});

typedef Event = ({
  DateTime time,
  bool done,
  EventType type,
});
import 'package:puppy_diary/types/enums.dart';

typedef IndividualData = ({
int id,
String name,
String fullName,
DateTime birthday,
List<({DateTime time, double weight})> weightHistory,
List<Event> eventHistory,
});

typedef RaceData = ();

typedef GeneralData = ();

typedef DogData = ();

typedef Event = ({
DateTime time,
bool done,
EventType type,
});
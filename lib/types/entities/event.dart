import 'package:puppy_diary/types/enums/event_type.dart';

class Event {
  int id;
  DateTime time;
  bool done;
  EventType type;
  String note;


  Event({
    this.id = -1,
    required this.time,
    this.done = false,
    required this.type,
    this.note = '',
  });


  Event.from(Event other)
    : id = other.id,
      time = other.time,
      done = other.done,
      type = other.type,
      note = other.note;
}
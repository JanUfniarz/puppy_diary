import 'package:puppy_diary/types/data_types/database_data.dart';
import 'package:puppy_diary/types/entities/dog.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/types/entities/weight.dart';
import 'package:puppy_diary/types/enums/event_type.dart';

mixin RepositoryConverter {

  RawData individualToRaw(Dog val) => (
    dog: {
      if (val.id != -1) 'id': val.id,
      'name': val.name,
      'full_name': val.fullName,
      'birthday': val.birthday.toIso8601String(),
    },
    weightHistory: val.weightHistory
        .map((el) => weightToRaw(el, val.id))
        .toList(),
    eventHistory: val.eventHistory
        .map((el) => eventToRaw(el, val.id))
        .toList()
  );


  RawObject weightToRaw(Weight weight, int individualID) => {
    if (weight.id != -1) 'id': weight.id,
    'individual_id': individualID,
    'time': weight.time.toIso8601String(),
    'weight': weight.weight,
  };

  RawObject eventToRaw(Event event, int individualID) => {
    if (event.id != -1) 'id': event.id,
    'individual_id': individualID,
    'time': event.time.toIso8601String(),
    'done': event.done ? 1 : 0,
    'type': event.type.toString(),
    'note': event.note,
  };


  Dog individualFromRaw(RawData raw) => Dog(
      id: raw.dog['id'] as int,
      name: raw.dog['name'] as String,
      fullName: raw.dog['full_name'] as String,
      birthday: _parse(raw.dog['birthday']),
      weightHistory: raw.weightHistory
          .map((weight) => weightFromRaw(weight))
          .toList(),
      eventHistory: raw.eventHistory
          .map((event) => eventFromRaw(event))
          .toList(),
  );

  Weight weightFromRaw(RawObject raw) => Weight(
    id: raw['id'] as int,
    time: _parse(raw['time']),
    weight: raw['weight'] as double
  );

  Event eventFromRaw(RawObject raw) => Event(
    id: raw['id'] as int,
    time: _parse(raw['time']),
    done: raw['done'] == 1,
    type: EventType.fromString(raw['type'] as String),
    note: raw['note'] as String
  );

  DateTime _parse(raw) => DateTime.parse(raw as String);
}
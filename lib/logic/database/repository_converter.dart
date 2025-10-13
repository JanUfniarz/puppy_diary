import 'package:puppy_diary/types/data_types/core_types.dart';
import 'package:puppy_diary/types/enums/event_type.dart';

mixin RepositoryConverter {

  RawData individualToRaw(IndividualData val) => (
    dog: {
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
    'individual_id': individualID,
    'time': weight.time.toIso8601String(),
    'weight': weight.weight,
  };

  RawObject eventToRaw(Event event, int individualID) => {
    'individual_id': individualID,
    'time': event.time.toIso8601String(),
    'done': event.done ? 1 : 0,
    'type': event.type.toString(),
    'note': event.note,
  };


  IndividualData individualFromRaw(RawData raw) => (
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

  Weight weightFromRaw(RawObject raw) => (
    time: _parse(raw['time']),
    weight: raw['weight'] as double
  );

  Event eventFromRaw(RawObject raw) => (
    time: _parse(raw['time']),
    done: raw['done'] == 1,
    type: EventType.fromString(raw['type'] as String),
    note: raw['note'] as String
  );

  DateTime _parse(raw) => DateTime.parse(raw as String);
}
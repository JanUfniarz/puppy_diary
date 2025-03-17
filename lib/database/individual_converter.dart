import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/types/enums.dart';

mixin IndividualConverter {
  RawData toRaw(IndividualData val) => (
    dog: {
      'name': val.name,
      'full_name': val.fullName,
      'birthday': val.birthday.toIso8601String(),
    },
    weightHistory: val.weightHistory.map((el) => {
      'individual_id': val.id,
      'time': el.time.toIso8601String(),
      'weight': el.weight,
    }).toList(),
    eventHistory: val.eventHistory.map((el) => {
      'individual_id': val.id,
      'time': el.time.toIso8601String(),
      'done': el.done,
      'type': el.type.toString()
    }).toList()
  );

  IndividualData fromRaw(RawData data) => (
      id: data.dog['id'] as int,
      name: data.dog['name'] as String,
      fullName: data.dog['full_name'] as String,
      birthday: _parse(data.dog['birthday']),
      weightHistory: data.weightHistory.map((weight) => (
        time: _parse(weight['time']),
        weight: weight['weight'] as double
      )).toList(),
      eventHistory: data.eventHistory.map((event) => (
        time: _parse(event['time']),
        done: event['done'] as bool,
        type: EventType.fromString(event['type'] as String)
      )).toList(),
  );

  DateTime _parse(raw) => DateTime.parse(raw as String);
}
import 'package:puppy_diary/logic/functions/date_time_functions.dart';
import 'package:puppy_diary/types/entities/dog.dart';
import 'package:puppy_diary/types/entities/event.dart';

extension DogData on Dog {
  double? get lastWeight => weightHistory.isEmpty
      ? null
      : weightHistory.reduce(
          (x, y) => x.time.isAfter(y.time) ? x : y
      ).weight;

  Event? get nextEvent => upcomingEvents.isEmpty
      ? null
      : upcomingEvents.reduce((x, y) => x.time.isBefore(y.time) ? x : y);

  List<Event> get upcomingEvents => eventHistory
      .where((event) => !event.done && event.time.isAfter(today()))
      .toList();

}
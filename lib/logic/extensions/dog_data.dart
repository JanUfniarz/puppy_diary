import 'package:puppy_diary/types/data_types/core_types.dart';

extension DogData on IndividualData {
  double? get lastWeight => weightHistory.isEmpty
      ? null
      : weightHistory.reduce(
          (x, y) => x.time.isAfter(y.time) ? x : y
      ).weight;

  Event? get nextEvent => upcomingEvents.isEmpty
      ? null
      : upcomingEvents.reduce((x, y) => x.time.isBefore(y.time) ? x : y);

  List<Event> get upcomingEvents => eventHistory
      .where((event) => !event.done && event.time.isAfter(DateTime.now()))
      .toList();

}


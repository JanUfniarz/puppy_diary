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

  List<Event> get upcomingEvents {

    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    return eventHistory
      .where((event) => !event.done && event.time.isAfter(todayStart))
      .toList();
  }

}
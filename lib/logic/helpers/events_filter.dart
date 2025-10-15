import 'package:puppy_diary/logic/functions/date_time_functions.dart';
import 'package:puppy_diary/types/entities/event.dart';
import 'package:puppy_diary/types/enums/event_type.dart';

class EventsFilter {
  bool onlyNotDone = false;
  bool showFuture = true;
  bool showPast = true;
  EventType? typeFilter;


  void resetFilters() {
    onlyNotDone = false;
    showFuture = true;
    showPast = true;
    typeFilter = null;
  }


  bool _typeAllowed(Event event) => typeFilter == null || event.type == typeFilter;

  bool _doneAllowed(Event event) => !onlyNotDone || !event.done;


  bool get _showAllDates => showFuture && showPast;
  bool get _showTodayAndFuture => showFuture && !showPast;
  bool get _showTodayAndPast => !showFuture && showPast;
  bool get _showOnlyToday => !showFuture && !showPast;


  bool _isPast(Event event) => event.time.isBefore(today());
  bool _isToday(Event event) => !event.time.isBefore(today()) && event.time.isBefore(tomorrow());
  bool _isFuture(Event event) => !event.time.isBefore(tomorrow());

  bool _dateAllowed(Event event) {
    if (_showAllDates) return true;
    if (_showTodayAndFuture && _isPast(event)) return false;
    if (_showTodayAndPast && _isFuture(event)) return false;
    if (_showOnlyToday && !_isToday(event)) return false;
    return true;
  }


  List<int> idsToShow(List<Event> events) => events
      .where(_typeAllowed)
      .where(_doneAllowed)
      .where(_dateAllowed)
      .map((el) => el.id)
      .toList();
}
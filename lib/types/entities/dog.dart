import 'package:puppy_diary/types/entities/weight.dart';
import 'package:puppy_diary/types/entities/event.dart';


class Dog {
  int id;
  String name;
  String fullName;
  DateTime birthday;
  List<Weight> weightHistory;
  List<Event> eventHistory;


  Dog({
    this.id = -1,
    required this.name,
    String? fullName,
    required this.birthday,
    List<Weight>? weightHistory,
    List<Event>? eventHistory,
  }) : fullName = fullName ?? name,
       weightHistory = weightHistory ?? [],
       eventHistory = eventHistory ?? [];


   Dog.from(Dog other) :
    id = other.id,
    name = other.name,
    fullName = other.fullName,
    birthday = other.birthday,
    weightHistory = List.from(other.weightHistory),
    eventHistory = List.from(other.eventHistory);
}
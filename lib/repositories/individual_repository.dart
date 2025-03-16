import 'package:puppy_diary/repositories/sqlite_repository.dart';
import 'package:puppy_diary/types/data_types.dart';
import 'package:puppy_diary/types/enums.dart';

class IndividualRepository extends SQLiteRepository {

  DateTime _parse(raw) => DateTime.parse(raw as String);

  Future<List<IndividualData>> getAll() async {
    bool isIn(el, dog) => el['individual_id'] == dog['id'];

    var db = await database;

    var weights = await db.query('weight_history');
    weightsTransformation(data) => (
      time: _parse(data['time']),
      weight: data['weight'] as double
    );

    var events = await db.query('event_history');
    eventsTransformation(data) => (
      time: _parse(data['time']),
      done: data['done'] as bool,
      type: EventType.fromString(data['type'] as String)
    );

    var dogs = await db.query('dogs');
    dogsTransformation(data) => (
      id: data['id'] as int,
      name: data['name'] as String,
      fullName: data['fullName'] as String,
      birthday: _parse(data['birthday']),
      weightHistory: weights
          .where((el) => isIn(el, data))
          .map(weightsTransformation).toList(),
      eventHistory: events
          .where((el) => isIn(el, data))
          .map(eventsTransformation).toList(),
    );

    return dogs.map(dogsTransformation).toList();
  }
}
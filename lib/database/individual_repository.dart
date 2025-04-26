import 'package:puppy_diary/database/individual_converter.dart';
import 'package:puppy_diary/database/sqlite_repository.dart';
import 'package:puppy_diary/types/data_types.dart';

class IndividualRepository
    extends SQLiteRepository
    with IndividualConverter {

  Future<List<IndividualData>> getAll() async {
    var db = await database;

    var weights = await db.query('weight_history');
    var events = await db.query('event_history');
    var dogs = await db.query('dogs');

    return dogs.map((dog) => fromRaw((
      dog: dog,
      weightHistory: _filter(weights, dog),
      eventHistory: _filter(events, dog),
    ))).toList();
  }

  Future<IndividualData> insertDog(IndividualData dog) async => await (
      await database
  ).transaction((txn) async {
    bool isNew = dog.id == -1;
    var data = toRaw(dog);

    int id = await txn.insert('dogs', data.dog);

    for (var weight in data.weightHistory) {
      if (isNew) weight['individual_id'] = id;
      await txn.insert('weight_history', weight);
    }

    for (var event in data.eventHistory) {
      if (isNew) event['individual_id'] = id;
      await txn.insert('event_history', event);
    }
    if (isNew) data.dog['id'] = id;

    return fromRaw(data);
  });

  Future<void> update(int id, RawObject data, {String table = 'dogs'}) async => (
      await database
  ).update(table, data, where: 'id = ?', whereArgs: [id]);

  RawList _filter(RawList original, RawObject dog) => original
      .where((el) => el['individual_id'] == dog['id'])
      .toList();
}
import 'package:puppy_diary/database/repository_converter.dart';
import 'package:puppy_diary/database/sqlite_repository.dart';
import 'package:puppy_diary/types/data_types/core_types.dart';

class IndividualRepository
    extends SQLiteRepository
    with RepositoryConverter {


  Future<List<Dog>> getAll() async {
    var db = await database;

    var weights = await db.query('weight_history');
    var events = await db.query('event_history');
    var dogs = await db.query('dogs');

    return dogs.map((dog) => individualFromRaw((
      dog: dog,
      weightHistory: _filter(weights, dog),
      eventHistory: _filter(events, dog),
    ))).toList();
  }




  Future<Dog> insertDog(Dog dog) async => await (
      await database
  ).transaction((txn) async {
    bool isNew = dog.id == -1;
    var data = individualToRaw(dog);

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

    return individualFromRaw(data);
  });




  Future<void> insertEvent(int individualID, Event event) async => (
      await database
  ).insert('event_history', eventToRaw(event, individualID));




  Future<void> insertWeight(int individualID, Weight weight) async => (
      await database
  ).insert('weight_history', weightToRaw(weight, individualID));




  Future<void> updateDog(Dog data) async => (
      await database
  ).update(
      'dogs',
      individualToRaw(data).dog,
      where: 'id = ?',
      whereArgs: [data.id]
  );


  Future<void> updateEvent(Event data, int individualID) async => (
      await database
  ).update(
      'event_history',
      eventToRaw(data, individualID),
      where: 'id = ?',
      whereArgs: [data.id]
  );


  Future<void> updateWeight(Weight data, int individualID) async => (
      await database
  ).update(
      'weight_history',
      weightToRaw(data, individualID),
      where: 'id = ?',
      whereArgs: [data.id]
  );




  RawList _filter(RawList original, RawObject dog) => original
      .where((el) => el['individual_id'] == dog['id'])
      .toList();


  Future<void> deleteDog(int id) async => (
      await database
  ).transaction((txn) async {
    await txn.delete('dogs', where: 'id = ?', whereArgs: [id]);
    await txn.delete('event_history', where: 'individual_id = ?', whereArgs: [id]);
    await txn.delete('weight_history', where: 'individual_id = ?', whereArgs: [id]);
  });


  Future<void> deleteEvent(int id) async => (
      await database
  ).delete('event_history', where: 'id = ?', whereArgs: [id]);


  Future<void> deleteWeight(int id) async => (
      await database
  ).delete('weight_history', where: 'id = ?', whereArgs: [id]);
}
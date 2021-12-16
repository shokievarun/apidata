/*
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembatCrud {
  // File path to a file in the current directory
  String dbPath = 'sample.db';
  DatabaseFactory dbFactory = databaseFactoryIo;
  Future<Database> get database async {
    _openDatabase();
  }

// We use the database factory to open the database
  Future _openDatabase() async {
    Database db = await dbFactory.openDatabase(dbPath);
  }


  // Use the animals store using Map records with int keys
  var store = intMapStoreFactory.store('animals');

// Store some objects
  await db.transaction((txn) async {
  await store.add(txn, {'name': 'fish'});
  await store.add(txn, {'name': 'cat'});

  // You can specify a key
  await store.record(10).put(txn, {'name': 'dog'});
});
}
*/

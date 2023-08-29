import 'package:fast_inspection/local_db/business_db_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database? _database;
  static Future<Database> get database async {
    var path = await getDatabasesPath();
    return _database ??= await openDatabase('db$path', onCreate: (db, version) {
      db.execute(BusinessDbProvider.createTableQuery);
      print('database created');
    }, version: 1);
  }
}

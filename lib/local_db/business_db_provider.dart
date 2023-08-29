import 'package:sqflite/sqflite.dart';

import '../models/business.dart';
import 'db_provider.dart';

class BusinessDbProvider {
  static const id = 'id';
  static const tableName = 'BusinessDetails';
  static const businessName = 'businessName';
  static const businessAddress = 'businessAddress';
  static const businessPhone = 'businessPhone';
  static const businessEmail = 'businessEmail';
  static const businessWebsite = 'businessWebsite';
  static const imagePath = 'imagePath';

  static String get createTableQuery => '''
    CREATE TABLE $tableName (
      $id INTEGER PRIMARY KEY,
      $businessName TEXT,
      $businessAddress TEXT,
      $businessPhone TEXT,
      $businessEmail TEXT,
      $businessWebsite TEXT,
      $imagePath TEXT
    )
  ''';
  static Future<bool> insertBusiness(Business business) async {
    Database db = await DbProvider.database;
    var rowId = await db.insert(tableName, business.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return rowId > 0;
  }

  static Future<Business?> getBusinesses() async {
    Database db = await DbProvider.database;
    List<Map<String, Object?>> businesses = await db.query(tableName);
    List<Business> list = businesses.map((e) => Business.fromMap(e)).toList();
    if (list.isNotEmpty) {
      return list[0];
    }
    return null;
  }

  Future<bool> updateBusiness(Business business) async {
    Database database = await DbProvider.database;
    var rowId = await database.update(tableName, business.toMap());
    return rowId > 0;
  }
}

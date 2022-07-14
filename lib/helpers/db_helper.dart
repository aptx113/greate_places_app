import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/place.dart';

class DBHelper {
  static const placesTable = 'user_places';
  static Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'place.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE $placesTable(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
    });
  }

  static Future<void> insert(String table, Place place) async {
    final db = await getDatabase();
    await db.insert(table, place.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Place>> getData(String table) async {
    final db = await getDatabase();
    final placeMaps = await db.query(table);

    return List.generate(
      placeMaps.length,
      (index) => Place(
        id: placeMaps[index]['id'] as String,
        title: placeMaps[index]['title'] as String,
        image: File(placeMaps[index]['image'] as String),
        location: PlaceLocation(
            latitude: placeMaps[index]['loc_lat'] as double,
            longitude: placeMaps[index]['loc_lng'] as double,
            address: placeMaps[index]['address'] as String),
      ),
    );
  }
}

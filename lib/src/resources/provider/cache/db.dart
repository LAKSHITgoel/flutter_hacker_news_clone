import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";
import "package:path/path.dart";
import "dart:io";

import "package:hacker_news/src/models/index.dart";
import "package:hacker_news/src/resources/abstract/index.dart";

class DbProvider implements Source, Cache{
  Database db;

  DbProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String dbPath = join(documentsDirectory.path, "items.db");
    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Items
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              dead INTEGER,
              kids BLOB,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
        """);
        // newDb.execute("""
        //   CREATE TABLE TopIds 
        //     (
        //       topids BLOB
        //     )
        // """);
      }
    );
  }
  // TODO
  Future<List<int>> fetchTopIds() {
    return null;
  }

  Future<ItemModel> fetchItem(int id) async {
    final List<Map<String, dynamic>> itemMap = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if (itemMap.length > 0) {
      return ItemModel.fromDB(itemMap.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db
      .insert(
        "Items", 
        item.toMapForDb(),
        conflictAlgorithm: ConflictAlgorithm.ignore
      );
  }

  Future<int> clear() {
    return db.delete("Items");
  }
}

final DbProvider dbProvider = DbProvider();
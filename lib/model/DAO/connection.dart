import 'package:sqflite/sqflite.dart';

class Connection {
  static Future<Database> getConnection() async {
    var sysPath = getDatabasesPath();
    var path = "$sysPath contacts.db";
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute(
            "create table contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, lastName TEXT, photoPath TEXT, phone TEXT, email TEXT, isFavorite INT)");
        // Outras instruções aqui
      },
    );
    return db;
  }
}

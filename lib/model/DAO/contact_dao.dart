import 'package:agenda_de_contatos/model/DAO/connection.dart';
import 'package:agenda_de_contatos/model/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO {
  static const String _table = "contacts";

  static Future<int> insert(Map<String, dynamic> map) async {
    Database database = await Connection.getConnection();
    int result = await database.insert(_table, map);
    return result;
  }

  static Future<int> update(Map<String, dynamic> map) async {
    Database database = await Connection.getConnection();
    int result = await database.update(
      _table,
      map,
      where: "id=?",
      whereArgs: [map["id"]],
    );
    return result;
  }

  static Future<List<Contact>> findAll() async {
    Database database = await Connection.getConnection();
    final map = await database.query(_table);
    return map.map((item) => Contact.fromMap(item)).toList();
  }

  // static List<Contact> findAll() {
  //   Database database = await Connection.getConnection();
  //   final maps = await database.query(_table, orderBy: "name asc",);
  //   return maps.map((item) => Contact.fromMap(item)).toList();
  // }
}

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String contactTable = "contactTable";
const String idColumn = "idColumn";
const String nameColumn = "nameColumn";
const String emailColumn = "emailColumn";
const String phoneColumn = "phoneColumn";

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider.internal();

  factory DatabaseProvider() => _instance;

  DatabaseProvider.internal();
  Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "expenses.db");

    return await openDatabase(path, version: 1, onCreate: (
      Database db,
      int newerVersion,
    ) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT,"
          "$phoneColumn TEXT)");
    });
  }

  Future<Contact> saveContact(Contact contact) async {
    Database? dbContact = await db;
    if (dbContact != null) {
      contact.id = await dbContact.insert(
        contactTable,
        contact.toMap(),
      );
      return contact;
    }
    throw Exception('Failed to save contacts!');
  }

  Future<Contact?> getContact(int id) async {
    Database? dbContact = await db;
    if (dbContact != null) {
      List<Map> maps = await dbContact.query(contactTable,
          columns: [
            idColumn,
            nameColumn,
            emailColumn,
            phoneColumn,
          ],
          where: "$idColumn = ?",
          whereArgs: [id]);
      if (maps.isNotEmpty) {
        return Contact.fromMap(maps.first);
      } else {
        return null;
      }
    }
    throw Exception('Failed to fetch contact');
  }

  Future<int> deleteContact(int id) async {
    Database? dbContact = await db;
    if (dbContact != null) {
      return await dbContact.delete(
        contactTable,
        where: "$idColumn = ?",
        whereArgs: [id],
      );
    }
    throw Exception('Failed to delete contact');
  }

  Future<int> updateContact(Contact contact) async {
    Database? dbContact = await db;
    if (dbContact != null) {
      return await dbContact.update(
        contactTable,
        contact.toMap(),
        where: "$idColumn = ?",
        whereArgs: [contact.id],
      );
    }
    throw Exception('Failed to update contact');
  }

  Future<List> getAllContacts() async {
    Database? dbContact = await db;
    if (dbContact != null) {
      List listMap = await dbContact.rawQuery("SELECT * FROM $contactTable");
      List<Contact> listContact = [];
      for (Map m in listMap) {
        listContact.add(Contact.fromMap(m));
      }
      return listContact;
    }

    throw Exception('Failed to fetch contacts');
  }
}

class Contact {
  int id = 0;
  String name = "";
  String email = "";
  String phone = "";

  Contact(this.id, this.name, this.email, this.phone);

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
    };

    if (id != 0) {
      map[idColumn] = id;
    }
    return map;
  }
}

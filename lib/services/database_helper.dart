import 'package:contact_manager_app/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._init();

  static final DatabaseHelper instance = DatabaseHelper._init();
  final String tableName = "contacts";

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _initDatabase("contacts_db");
  }

  // Function for initialising DB
  Future<Database> _initDatabase(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tableName(id INTEGER PRIMARY KEY,name TEXT NOT NULL,phone TEXT UNIQUE,email TEXT UNIQUE)",
        );
      },
    );
  }

  // Function to Add a new Contact
  Future<void> addContact(ContactModel contact) async {
    final db = await database;
    await db.insert(
      tableName,
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Function to retrieve all contacts
  Future<List<ContactModel>> getContacts() async {
    final db = await database;
    final contacts = await db.query(tableName);
    return List.generate(
      contacts.length,
      (index) => ContactModel.fromMap(contacts[index]),
    );
  }

  // Function to Update a contact
  Future<void> updateContact(ContactModel contact) async {
    final db = await database;
    await db.update(
      tableName,
      contact.toMap(),
      where: "id=?",
      whereArgs: [contact.id],
    );
  }

  // Function to Delete a contact
  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(tableName, where: "id=?", whereArgs: [id]);
  }
}

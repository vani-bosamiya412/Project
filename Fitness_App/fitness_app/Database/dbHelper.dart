import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FitnessDB {
  // database details
  static final _dbname = "fitness_app.db";
  static final _dbVersion = 1;

  // users table
  static final tableUsers = "users";
  static final columnUserId = "id";
  static final columnUserName = "name";
  static final columnUserEmail = "email";
  static final columnUserPassword = "password";


  // private constructor
  FitnessDB._privateConstructor();

  // database object
  Database? _db;

  // initialization
  static final FitnessDB instance = FitnessDB._privateConstructor();

  // getter
  Future<Database> get database async => _db ??= await _initDatabase();

  // init database
  _initDatabase() async {
    Directory directoryPath = await getApplicationDocumentsDirectory();
    String finalPath = join(directoryPath.path, _dbname);
    return await openDatabase(finalPath, version: _dbVersion, onCreate: _onCreate);
  }

  // create tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUsers (
        $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUserName TEXT NOT NULL,
        $columnUserEmail TEXT UNIQUE NOT NULL,
        $columnUserPassword TEXT NOT NULL
      )
    ''');
  }

  // sign up (insert new user)
  Future<int> insertUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableUsers, row);
  }

  // login (check user exists)
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    Database db = await instance.database;
    final result = await db.query(
      tableUsers,
      where: '$columnUserEmail = ? AND $columnUserPassword = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // update password by email
  Future<int> updatePassword(String email, String newPassword) async {
    Database db = await instance.database;
    return await db.update(
      tableUsers,
      {columnUserPassword: newPassword},
      where: '$columnUserEmail = ?',
      whereArgs: [email],
    );
  }
}
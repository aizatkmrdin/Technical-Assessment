import 'package:sqflite/sqflite.dart';

class ToDoDatabase {
  static final ToDoDatabase instance = ToDoDatabase._init();

  static Database? _database;
  ToDoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {}
}

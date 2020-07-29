// import 'dart:io';

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// // //import 'package:path_provider/path_provider.dart';

// class DatabaseHelper{

//   static final _databaseName = "drovak.db";
//   static final _databaseVersion = 1;

//   // make this a singleton class
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   // only have a single app-wide reference to the database
//   static Database _database;
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     // lazily instantiate the db the first time it is accessed
//     _database = await initDatabase();
//     return _database;
//   }

//   // this opens the database (and creates it if it doesn't exist)
//   initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {}

// }
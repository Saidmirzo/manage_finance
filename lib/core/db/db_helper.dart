// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/services.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBHelper {
//   DBHelper();

//   late Database database;

//   final String databaseName = 'manage_finance.db';
//   final int databaseVersion = 1;
//   final String tableWordEntity = 'word_entity';
//   final String tableWordBank = 'word_bank';
//   final String tableSpeakingView = 'speaking_view';

//   // opens the database (and creates if it do not exist)
//   Future<void> init() async {
//     var databasesPath = await getDatabasesPath();
//     var path = join(databasesPath, databaseName);

//     // Check if the database exists
//     var exists = await databaseExists(path);

//     if (!exists) {
//       // Make sure the parent directory exists
//       try {
//         await Directory(dirname(path)).create(recursive: true);
//       } catch (_) {}

//       // Copy from asset
//       ByteData data = await rootBundle.load(join("assets", databaseName));
//       List<int> bytes =
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

//       await File(path).writeAsBytes(bytes, flush: true);
//     } else {}
//     database = await openDatabase(
//       path,
//       onCreate: (db, version) async {
//         await db.execute(
//             'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT)');
//       },
//     );
//   }
// }

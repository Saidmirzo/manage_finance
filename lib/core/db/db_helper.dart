import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper();

  late Database database;

  final String databaseName = 'manage_finance.db';
  final int databaseVersion = 1;
  final String tableWordEntity = 'word_entity';
  final String tableWordBank = 'word_bank';
  final String tableSpeakingView = 'speaking_view';

  // opens the database (and creates if it do not exist)
  Future<void> init() async {
    // var databasesPath = await getDatabasesPath();
    var path = join('assets/', databaseName);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
    database = await openDatabase(
      path,
    );
  }

  Future getTEachers (int parentId) async {
    try {
      if (database.isOpen) {
        final  response = await database.rawQuery("SELECT * FROM $tableSpeakingView WHERE parentId=$parentId");
        // var speakingViewList = List<CatalogModel>.from(response.map((e) {
        //   var item = SpeakingViewModel.fromJson(e);
        //   return CatalogModel(
        //       id: item.wordId, word: item.word, translate: item.translation, category: item.parentId.toString());
        // }));
      }
    } catch (e) {
      log("getSpeakingViewList", error: e.toString());
    }
    return null;
  }
}

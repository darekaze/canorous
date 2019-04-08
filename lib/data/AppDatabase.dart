import 'dart:async';

import 'package:canorous/config/env.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();
  static AppDatabase get instance => _singleton;
  Completer<Database> _dbOpenCompleter;

  AppDatabase._();

  // Database will be opened when instance is first called
  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final path = await _getDBPath();
    final db = await databaseFactoryIo.openDatabase(path);

    _dbOpenCompleter.complete(db);
  }

  Future<String> _getDBPath() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    return join(appDocumentDir.path, Env.value.dbName);
  }

  // For development use
  Future deleteDB() async {
    var path = await _getDBPath();
    await databaseFactoryIo.deleteDatabase(path);
  }
}

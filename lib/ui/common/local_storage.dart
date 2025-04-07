import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'storage_dir.dart';

/// Class for storing values locally.
/// For a financial app, these values should be encrypted
/// following PCI-DSS Standards.
///
/// NOTE: DO NOT MISUSE (Only store values when ABSOLUTELY Necessary

class LocalStorage {
  Future save(String key, dynamic value) async {
    var store = StoreRef.main();

    await store.record(key).put(await _getDatabase(), value);
  }

  Future<dynamic> fetch(String key) async {
    var store = StoreRef.main();

    var result = await store.record(key).get(await _getDatabase());

    //??
    return result;
  }

  Future delete(String key) async {
    var store = StoreRef.main();

    await store.record(key).delete(await _getDatabase());
  }

  Future<Database> _getDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = "${appDir.path}/${StorageDir.dbName}";
    DatabaseFactory dbFactory = databaseFactoryIo;

    Database db = await dbFactory.openDatabase(dbPath);
    return db;
  }
}

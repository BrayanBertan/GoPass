import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoRepository {
  static final BancoRepository? _instance = BancoRepository.internal();
  factory BancoRepository() => _instance!;
  BancoRepository.internal();
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final dataBasesPath = await getDatabasesPath();
    final path = join(dataBasesPath, "tewfesf.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE usuarios("
          "id INTEGER PRIMARY KEY,"
          "nome TEXT,"
          "email TEXT,"
          "senha TEXT,"
          "cpf TEXT,"
          "foto TEXT,"
          "tipo TEXT,"
          "nascimento INTEGER) ");
    });
  }
}

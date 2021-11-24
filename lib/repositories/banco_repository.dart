import 'dart:async';

import 'package:gopass_app/models/categoria_model.dart';
import 'package:gopass_app/models/usuario_model.dart';
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
    final path = join(dataBasesPath, "dbapresentacao1.db");
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
      await db.execute("CREATE TABLE categorias("
          "id INTEGER PRIMARY KEY,"
          "nome TEXT) ");
      await db.execute("CREATE TABLE eventos("
          "id INTEGER PRIMARY KEY,"
          "categoria_id INTEGER,"
          "usuario_id INTEGER,"
          "nome TEXT,"
          "foto TEXT,"
          "descricao TEXT NULLABLE,"
          "endereco TEXT,"
          "data_evento INTEGER,"
          "lotacao_minima INTEGER,"
          "lotacao_maxima INTEGER,"
          "valor float(25,10))");
      await db.execute("CREATE TABLE assentos("
          "id INTEGER PRIMARY KEY,"
          "reserva_id INTEGER,"
          "fileira TEXT,"
          "numero INTEGER)");
      await db.execute("CREATE TABLE reservas("
          "id INTEGER PRIMARY KEY,"
          "evento_id INTEGER,"
          "usuario_id INTEGER,"
          "data_reserva INTEGER,"
          "confirmada INTEGER,"
          "modo_pagamento TEXT)");
      await db.insert('categorias',
          Categoria(id: 1, nome: "Culturais e de entretenimento").toMap());
      await db.insert(
          'categorias', Categoria(id: 2, nome: "Esportivos").toMap());
      await db.insert(
          'categorias', Categoria(id: 3, nome: "Corporativos").toMap());
      await db.insert(
          'categorias', Categoria(id: 4, nome: "Religiosos").toMap());
      await db.insert('categorias',
          Categoria(id: 5, nome: "Acadêmicos e educacionais").toMap());
      await db.insert(
          'usuarios',
          Usuario(
                  nome: "admin",
                  nascimento: DateTime.now().subtract(Duration(days: 7300)),
                  foto: 'assets/images/admin.png',
                  cpf: '11111111111',
                  email: 'admin@admin.com',
                  senha: '123456',
                  tipo: 'A')
              .toMap());
    });
  }
}

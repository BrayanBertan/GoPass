import 'dart:async';

import 'package:gopass_app/models/categoria_model.dart';
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
      await db.execute("CREATE TABLE categorias("
          "id INTEGER PRIMARY KEY,"
          "nome TEXT) ");
      await db.execute("CREATE TABLE eventos("
          "id INTEGER PRIMARY KEY,"
          "categoria_id INTEGER FOREIGN KEY,"
          "usuario_id INTEGER FOREIGN KEY,"
          "nome TEXT,"
          "descricao TEXT NULLABLE,"
          "endereco TEXT,"
          "data_evento INTEGER,"
          "lotacao_minima INTEGER,"
          "lotacao_maxima INTEGER,"
          "valor float(25,10),"
          "FOREIGN KEY (categoria_id) REFERENCES categorias(id),"
          "FOREIGN KEY (usuario_id) REFERENCES usuarios(id))"
      );
      await db.execute("CREATE TABLE assentos("
          "id INTEGER PRIMARY KEY,"
          "evento_id INTEGER FOREIGN KEY,"
          "usuario_id INTEGER FOREIGN KEY,"
          "data_reserva INTEGER,"
          "confirmada INTEGER,"
          "modo_pagamento ENUM('PIX', 'CARTAO'),"
          "FOREIGN KEY (evento_id) REFERENCES eventos(id),"
          "FOREIGN KEY (usuario_id) REFERENCES usuarios(id)"
      );
      await db.execute("CREATE TABLE reservas("
          "id INTEGER PRIMARY KEY,"
          "evento_id INTEGER FOREIGN KEY,"
          "usuario_id INTEGER FOREIGN KEY,"
          "assento_id INTEGER FOREIGN KEY,"
          "data_reserva INTEGER,"
          "confirmada INTEGER,"
          "modo_pagamento ENUM('PIX', 'CARTAO'),"
          "FOREIGN KEY (evento_id) REFERENCES eventos(id),"
          "FOREIGN KEY (assento_id) REFERENCES assentos(id)"
      );
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
    });
  }
}

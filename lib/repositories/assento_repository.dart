import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/assento_model.dart';
import 'package:gopass_app/models/usuario_model.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:sqflite/sqflite.dart';

class AssentoRepository {
  final br = Modular.get<BancoRepository>();

  Future<Assento> saveAssento(Assento assento) async {
    Database dbAssento = await br.db;
    assento.id = await dbAssento.insert("assentos", assento.toMap());
    return assento;
  }

  Future<Assento?> getAssento(int id) async {
    Database dbAssento = await br.db;
    List<Map> maps = await dbAssento.query("assentos",
        columns: ['id', 'evento_id', 'usuario_id', 'data_reserva', 'confirmada', 'modo_pagamento'],
        where: "id = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Assento.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteAssento(int id) async {
    Database dbAssento = await br.db;

    return await dbAssento
        .delete("assentos", where: "$id = ?", whereArgs: [id]);
  }

  Future<int> updateAssento(Assento assento) async {
    Database dbAssento = await br.db;

    return await dbAssento.update("assento", assento.toMap(),
        where: "id = ?", whereArgs: [assento.id]);
  }

  Future<List<Assento>> getAllUsuario() async {
    Database dbAssento = await br.db;
    List<Map> maps = await dbAssento.rawQuery("SELECT * FROM assentos");
    List<Assento> listAssento = [];
    for (Map m in maps) {
      listAssento.add(Assento.fromMap(m));
    }
    return listAssento;
  }

  Future close() async {
    Database dbAssento = await br.db;
    dbAssento.close();
  }
}

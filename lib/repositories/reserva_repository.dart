import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:sqflite/sqflite.dart';

class ReservaRepository {
  final br = Modular.get<BancoRepository>();

  Future<Reserva> saveReserva(Reserva reserva) async {
    Database dbReserva = await br.db;
    reserva.id = await dbReserva.insert("reservas", reserva.toMap());
    return reserva;
  }

  Future<Reserva?> getReserva(id) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.query("reservas",
        columns: [
          'id',
          'evento_id',
          'usuario_id',
          'assento_id',
          'data_reserva',
          'confirmada',
          'modo_pagamento'
        ],
        where: "id = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Reserva.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteReserva(int id) async {
    Database dbReserva = await br.db;

    return await dbReserva
        .delete("reservas", where: "$id = ?", whereArgs: [id]);
  }

  Future<int> updateReserva(Reserva reserva) async {
    Database dbReserva = await br.db;

    return await dbReserva.update("reservas", reserva.toMap(),
        where: "id = ?", whereArgs: [reserva.id]);
  }

  Future<List<Reserva>> getAllReserva(int evento) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva
        .rawQuery("SELECT * FROM reservas WHERE evento_id = $evento");
    List<Reserva> listReserva = [];
    for (Map m in maps) {
      listReserva.add(Reserva.fromMap(m));
    }
    return listReserva;
  }

  Future close() async {
    Database dbReserva = await br.db;
    dbReserva.close();
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/assento_model.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/repositories/assento_repository.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:sqflite/sqflite.dart';

class ReservaRepository {
  final br = Modular.get<BancoRepository>();

  Future<Reserva> saveReserva(Reserva reserva, List<int> assentos) async {
    Database dbReserva = await br.db;
    reserva.id = await dbReserva.insert("reservas", reserva.toMap());
    AssentoRepository assentoRepository = Modular.get<AssentoRepository>();
    assentos.forEach((element) async => await assentoRepository
        .saveAssento(Assento(numero: element, reserva_id: reserva.id)));
    return reserva;
  }

  Future<Reserva?> getReserva(id) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.query("reservas",
        columns: [
          'id',
          'evento_id',
          'usuario_id',
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

  Future<List<int>> getAllReserva(int evento) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.rawQuery(
        "SELECT a.numero FROM assentos AS a "
        "INNER JOIN reservas AS b ON b.id = a.reserva_id WHERE b.evento_id = $evento");
    List<int> assentos = [];
    maps.forEach((element) {
      assentos.add(element['numero']);
    });
    return assentos;
  }

  Future<List<Reserva>> getAllReservasUsuario(int usuario) async {
    print('repository');
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.rawQuery(
        "SELECT a.*,b.nome AS evento,b.data_evento,b.valor,b.foto FROM reservas AS a "
        "INNER JOIN eventos AS b ON b.id = a.evento_id WHERE a.usuario_id = $usuario");
    List<Reserva> reservas = [];
    maps.forEach((element) => reservas.add(Reserva.fromMap(element)));
    print(reservas);
    return reservas;
  }

  Future close() async {
    Database dbReserva = await br.db;
    dbReserva.close();
  }
}

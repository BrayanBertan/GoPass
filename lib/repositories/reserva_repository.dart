import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/assento_model.dart';
import 'package:gopass_app/models/grafico_model.dart';
import 'package:gopass_app/models/reserva_model.dart';
import 'package:gopass_app/repositories/assento_repository.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:sqflite/sqflite.dart';

class ReservaRepository {
  final br = Modular.get<BancoRepository>();

  Future<Reserva> saveReserva(
      Reserva reserva, List<Map<String, dynamic>> assentos) async {
    Database dbReserva = await br.db;
    reserva.id = await dbReserva.insert("reservas", reserva.toMap());
    AssentoRepository assentoRepository = Modular.get<AssentoRepository>();
    assentos.forEach((element) async => await assentoRepository.saveAssento(
        Assento(
            numero: element['assento'],
            reserva_id: reserva.id,
            fileira: element['linha'])));
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
    // reserva.modo_pagamento = '';
    // reserva.confirmada = 0;
    // reserva.data_reserva = DateTime.now().subtract(Duration(hours: 72));
    return await dbReserva.update("reservas", reserva.toMap(),
        where: "id = ?", whereArgs: [reserva.id]);
  }

  Future<List<int>> getAllReserva(int evento) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.rawQuery(
        "SELECT a.numero FROM assentos AS a "
        "INNER JOIN reservas AS b ON b.id = a.reserva_id WHERE b.evento_id = $evento  AND (julianday(DATETIME('now', '-3 hour')) - julianday(datetime(b.data_reserva, 'unixepoch'))) < 1");
    List<int> assentos = [];
    maps.forEach((element) {
      assentos.add(element['numero']);
    });
    return assentos;
  }

  Future<List<Reserva>> getAllReservasUsuario(int usuario) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.rawQuery(
        "SELECT a.*,b.nome AS evento,b.data_evento,b.valor,b.foto,(SELECT COUNT(*) FROM assentos WHERE reserva_id = a.id) AS qtde_ingressos FROM reservas AS a "
        "INNER JOIN eventos AS b ON b.id = a.evento_id WHERE a.usuario_id = $usuario ORDER BY a.confirmada");
    List<Reserva> reservas = [];
    maps.forEach((element) => reservas.add(Reserva.fromMap(element)));
    print('reservas $maps');
    return reservas;
  }

  Future<List<Assento>> getAllAssentos(int reserva) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva
        .rawQuery("SELECT * FROM assentos WHERE reserva_id = $reserva");
    List<Assento> assentos = [];
    maps.forEach((element) => assentos.add(Assento.fromMap(element)));

    return assentos;
  }

  Future<List<GraficoBarra>> getGrafico(int evento) async {
    Database dbReserva = await br.db;
    List<Map> maps = await dbReserva.rawQuery(
        "SELECT confirmada,COUNT(*) AS qtd,data_reserva FROM reservas WHERE evento_id = $evento GROUP BY confirmada,data_reserva ORDER BY confirmada DESC");
    List<GraficoBarra> graficos = [];
    List<GraficoBarra> graficos2 = [];
    maps.forEach((element) => graficos.add(GraficoBarra.fromMap(element)));
    print(maps);
    late Iterable<GraficoBarra> contain;
    graficos.forEach((i) {
      contain = graficos.where((j) => j.eixoX == i.eixoX);
      if (contain.isNotEmpty &&
          graficos2.where((j) => j.eixoX == i.eixoX).isEmpty) {
        graficos2.add(GraficoBarra(contain.toList()[0].eixoX, contain.length));
      }
    });
    print(graficos2);
    return graficos2;
  }

  Future close() async {
    Database dbReserva = await br.db;
    dbReserva.close();
  }
}

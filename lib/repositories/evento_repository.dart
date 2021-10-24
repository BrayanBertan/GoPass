import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:sqflite/sqflite.dart';

class EventoRepository {
  final br = Modular.get<BancoRepository>();

  Future<Evento> saveEvento(Evento evento) async {
    Database dbEvento = await br.db;
    evento.id = await dbEvento.insert("eventos", evento.toMap());
    return evento;
  }

  Future<Evento?> getEvento(int id) async {
    Database dbEvento = await br.db;
    List<Map> maps = await dbEvento.query("eventos",
        columns: ['id', 'categoria_id', 'usuario_id', 'nome', 'descricao', 'endereco', 'data_evento', 'lotacao_minima', 'lotacao_maxima', 'valor']);
    if (maps.length > 0) {
      return Evento.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteEvento(int id) async {
    Database dbEvento = await br.db;

    return await dbEvento
        .delete("eventos", where: "$id = ?", whereArgs: [id]);
  }

  Future<int> updateEvento(Evento evento) async {
    Database dbEvento = await br.db;

    return await dbEvento.update("eventos", evento.toMap(),
        where: "id = ?", whereArgs: [evento.id]);
  }

  Future<List<Evento>> getAllEvento() async {
    Database dbEvento = await br.db;
    List<Map> maps = await dbEvento.rawQuery("SELECT * FROM eventos");
    List<Evento> listEvento = [];
    for (Map m in maps) {
      listEvento.add(Evento.fromMap(m));
    }
    return listEvento;
  }

  Future close() async {
    Database dbEvento = await br.db;
    dbEvento.close();
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/categoria_model.dart';
import 'package:gopass_app/models/evento_model.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:gopass_app/stores/filter_store.dart';
import 'package:intl/intl.dart';
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
        columns: [
          'id',
          'categoria_id',
          'usuario_id',
          'nome',
          'descricao',
          'endereco',
          'data_evento',
          'lotacao_minima',
          'lotacao_maxima',
          'valor',
          'foto'
        ],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Evento.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteEvento(int id) async {
    Database dbEvento = await br.db;

    return await dbEvento.delete("eventos", where: "$id = ?", whereArgs: [id]);
  }

  Future<int> updateEvento(Evento evento) async {
    Database dbEvento = await br.db;

    return await dbEvento.update("eventos", evento.toMap(),
        where: "id = ?", whereArgs: [evento.id]);
  }

  Future<List<Evento>> getAllEvento(String search, FilterStore filter) async {
    var format = DateFormat('yyyy-MM-dd');
    Database dbEvento = await br.db;
    DateTime dtInicial = DateTime.now().subtract(Duration(days: 3000));
    DateTime dtFinal = DateTime.now().add(Duration(days: 3000));
    if (filter.dataInicial != null) dtInicial = filter.dataInicial!;
    if (filter.dataFinal != null) dtFinal = filter.dataFinal!;

    String sql =
        "SELECT a.*,(SELECT COUNT(*) FROM assentos WHERE reserva_id in (SELECT id FROM reservas WHERE evento_id = a.id AND confirmada = 1)) AS total_vendido FROM eventos AS a WHERE DATETIME(a.data_evento, 'unixepoch')  BETWEEN '$dtInicial' AND '$dtFinal' AND a.valor <= ${filter.precoMax}";

    if (search.isNotEmpty) sql = "$sql AND nome LIKE '%$search%'";

    if (filter.categoriasSelecionadasList.isNotEmpty) {
      dynamic categorias = [];
      filter.categoriasSelecionadasList.forEach((element) {
        categorias.add(element.id);
      });
      categorias = categorias.toString();
      categorias = categorias.replaceAll("[", "(");
      categorias = categorias.replaceAll("]", ")");
      sql = "$sql AND categoria_id IN $categorias";
    }
    sql = "$sql ORDER BY data_evento DESC";
    List<Map> maps = await dbEvento.rawQuery(sql);
    print('gambiarra $maps');
    List<Evento> listEvento = [];
    for (Map m in maps) {
      listEvento.add(Evento.fromMap(m));
    }
    return listEvento;
  }

  Future<List<Categoria>> getAllCategorias() async {
    Database dbEvento = await br.db;
    List<Map> maps = await dbEvento.rawQuery("SELECT * FROM categorias");
    List<Categoria> listCategoria = [];
    for (Map m in maps) {
      listCategoria.add(Categoria.fromMap(m));
    }
    return listCategoria;
  }

  Future close() async {
    Database dbEvento = await br.db;
    dbEvento.close();
  }
}

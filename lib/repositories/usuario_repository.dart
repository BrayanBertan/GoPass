import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/models/usuario_model.dart';
import 'package:gopass_app/repositories/banco_repository.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioRepository {
  final br = Modular.get<BancoRepository>();

  Future<Usuario> saveUsuario(Usuario usuario) async {
    Database dbUsuario = await br.db;
    usuario.id = await dbUsuario.insert("usuarios", usuario.toMap());
    return usuario;
  }

  Future<Usuario?> getUsuario(String email, String senha) async {
    Database dbUsuario = await br.db;
    List<Map> maps = await dbUsuario.query("usuarios",
        columns: ['id', 'nome', 'email', 'cpf', 'foto', 'nascimento', 'tipo'],
        where: "email = ? AND senha = ?",
        whereArgs: [email, senha]);
    if (maps.length > 0) {
      return Usuario.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUsuario(int id) async {
    Database dbUsuario = await br.db;

    return await dbUsuario
        .delete("usuarios", where: "$id = ?", whereArgs: [id]);
  }

  Future<int> updateUsuario(Usuario usuario) async {
    Database dbUsuario = await br.db;

    return await dbUsuario.update("usuarios", usuario.toMap(),
        where: "id = ?", whereArgs: [usuario.id]);
  }

  Future<List<Usuario>> getAllUsuario() async {
    Database dbUsuario = await br.db;
    List<Map> maps = await dbUsuario.rawQuery("SELECT * FROM usuarios");
    List<Usuario> listUsuario = [];
    for (Map m in maps) {
      listUsuario.add(Usuario.fromMap(m));
    }
    return listUsuario;
  }

  Future close() async {
    Database dbUsuario = await br.db;
    dbUsuario.close();
  }
}

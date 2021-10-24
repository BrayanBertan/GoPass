class Categoria {
  int? id;
  String? nome;

  Categoria({this.id, this.nome});

  Categoria.fromMap(Map map) {
    id = map['id'];
    nome = map['nome'];
  }

  Map<String, Object?> toMap() {
    Map<String, dynamic>? map = {
      'nome': nome,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "id: $id Nome: $nome";
  }
}
